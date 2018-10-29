//
//  TaskCell.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class TaskCell: UICollectionViewCell {

    @IBOutlet weak var taskTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addShadow()
    }
    
    func setup(title: String?){
        taskTitleLabel.text = title
    }
    

}
