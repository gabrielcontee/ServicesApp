//
//  UIAlertController.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func alertUser(title: String, _ msg : String, handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let errorAlert = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(errorAlert)
        return alert
    }
    
}
