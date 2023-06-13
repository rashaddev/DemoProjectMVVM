//
//  GeneralExtensions.swift
//  Demo1
//
//  Created by Jahan on 14/06/2023.
//

import UIKit

extension UIViewController {
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
