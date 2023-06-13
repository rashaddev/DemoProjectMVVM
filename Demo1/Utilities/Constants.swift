//
//  Constants.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import UIKit

struct Constants {

    static let baseUrl = "http://api.openweathermap.org/data/2.5/"
    static let apiKey = "b274c5ce65b3e435688f3098769c6dee"
    static let baseImageUrl = "http://openweathermap.org/img/w/"
    struct endPoints {
        static let currentWeather = "weather"
    }

    struct viewControllers {
        static let homeVC = "HomeViewController"
        static let navBar = "NavBar"
    }

    struct tableViewCells {
        static let headerTableViewCell = "HomeHeaderTableViewCell"
        static let detailTableViewCell = "HomeTableViewCell"
    }


    struct colors {
        static var darkGrayColor = UIColor(named: "appDarkGray")
        static var appBlack = UIColor(named: "appBlack")
        static var appGray = UIColor(named: "appGray")
        static var appWhite = UIColor(named: "appWhite")
        static var buttonBG = UIColor(named: "buttonBG")
    }


}
