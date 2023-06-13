//
//  ViewController.swift
//  Demo1
//
//  Created by Jahan on 01/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeView: HomeView!

    lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeView.setupTableView(controller: self)
        initViewModel()
    }

    func initViewModel() {

        // Naive binding
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( message )
                }
            }
        }

        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                self?.homeView.refreshControl.endRefreshing()
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.homeView.showActivityIndicator()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.homeView.homeDetailTableView.alpha = 0.0
                    })
                }else {
                    self?.homeView.hideActivityIndicator()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.homeView.homeDetailTableView.alpha = 1.0
                    })
                }
            }
        }

        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.homeView.homeDetailTableView.reloadData()
            }
        }

        viewModel.initFetch()

    }

    @objc
    func refresh(_ sender: AnyObject) {
        if !viewModel.isLoading {
            viewModel.initFetch()
        }
    }
}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = viewModel.getCellViewModel( at: indexPath)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCells.headerTableViewCell , for: indexPath) as! HomeHeaderTableViewCell
            cell.configCell(model : cellVM)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCells.detailTableViewCell , for: indexPath) as! HomeTableViewCell
            cell.configCell(model : cellVM)
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        }
        return UITableView.automaticDimension
    }

}

/*
 HI Rashad

 Display weather Detail screen of specific Location

 Task 1.

 Calling Webservice at below webservice

 http://api.openweathermap.org/data/2.5/weather?appid=b274c5ce65b3e435688f3098769c6dee&q=Irving

 Task 2.

 Design screen shared in screenshot attached (Skip Search Field if you feel so)

 a) Create Custom views

 b) Displaying field should be dynamic based on need

 Use single responsibility concept
 2. Use appropriate design pattern , (MVVM will be better)

 3. Use proper error handling in each and every case

 4. Create project and upload on git repo and share the link in reply to this mail.

 --

 Thanks

 Sudhir Kumar
 */
