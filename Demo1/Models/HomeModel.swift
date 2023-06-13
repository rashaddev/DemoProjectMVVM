//
//  HomeModel.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import Foundation

struct HomeModel {

    let title : String?
    let description : String?
    let Image : String?
    let isHeader : Bool
    
    init(title : String?, description : String?,image : String = "" ,isHeader : Bool = false) {
        self.title = title ?? ""
        self.description = description ?? ""
        self.Image = image
        self.isHeader = isHeader
    }

}
