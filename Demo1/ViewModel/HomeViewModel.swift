//
//  HomeViewModel.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import Foundation

class HomeViewModel {

    private var currentWeather: WeatherModel?

    private var cellViewModels: [HomeModel] = [HomeModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var cityName = "Irving"
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    var numberOfCells: Int {
        return cellViewModels.count
    }


    var reloadTableViewClosure: (()->Void)?
    var showAlertClosure: (()->Void)?
    var updateLoadingStatus: (()->Void)?

    init() {

    }

    func initFetch() {
        self.isLoading = true
        NetworkManager.sharedInstance.getCurrentWeather(cityName: cityName) { [weak self] success, weather, error in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.localizedDescription
            }else if let weather = weather {
                self?.processWeather(weather: weather)
            }
        }
    }

    func getCellViewModel( at indexPath: IndexPath ) -> HomeModel {
        return cellViewModels[indexPath.row]
    }

    private func processWeather( weather: WeatherModel ) {
        currentWeather = weather // Cache
        var modelsList = [HomeModel]()
        if let weatherStatus = weather.weather?.first {
            modelsList.append(HomeModel(title: cityName, description: weatherStatus.descriptionField, image: Constants.baseImageUrl + (weatherStatus.icon ?? "") + ".png",isHeader: true))
        }
        modelsList.append(HomeModel(title: "Temprature", description: "\(weather.main?.temp ?? 0.0) K"))
        modelsList.append(HomeModel(title: "Pressure", description: "\(weather.main?.pressure ?? 0) hpa"))
        modelsList.append(HomeModel(title: "Humidity", description: "\(weather.main?.humidity ?? 0) %"))
        modelsList.append(HomeModel(title: "Min Temprature", description: "\(weather.main?.tempMin ?? 0.0) hpa"))
        modelsList.append(HomeModel(title: "Max Temprature", description: "\(weather.main?.tempMax ?? 0.0) K"))
        modelsList.append(HomeModel(title: "Wind Speed", description: "\(weather.wind?.speed ?? 0.0)"))
        modelsList.append(HomeModel(title: "Sunrise", description: "\(weather.sys?.sunrise ?? 0)"))
        modelsList.append(HomeModel(title: "Sunset", description: "\(weather.sys?.sunset ?? 0)"))
        self.cellViewModels = modelsList
    }

}
