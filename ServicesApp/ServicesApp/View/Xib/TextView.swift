
//
//  TextView.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

extension UITextView{
    
    func adjustUITextViewHeight(arg : UITextView){
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
        
    }
}

