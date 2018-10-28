//
//  UIView.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

extension UIView{
    func roundedView(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}
