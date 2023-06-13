//
//  HomeView.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var homeDetailTableView : UITableView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!

    let refreshControl = UIRefreshControl()
    
    func setupTableView(controller : HomeViewController) {
        var nib = UINib(nibName: Constants.tableViewCells.headerTableViewCell, bundle: .main)
        homeDetailTableView.register(nib, forCellReuseIdentifier: Constants.tableViewCells.headerTableViewCell)
        nib = UINib(nibName: Constants.tableViewCells.detailTableViewCell, bundle: .main)
        homeDetailTableView.register(nib, forCellReuseIdentifier: Constants.tableViewCells.detailTableViewCell)

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(controller, action: #selector(controller.refresh(_:)), for: .valueChanged)
        homeDetailTableView.addSubview(refreshControl)
    }

    func showActivityIndicator(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }

}
