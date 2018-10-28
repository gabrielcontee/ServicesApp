//
//  CommentaryCell.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class CommentaryCell: UICollectionViewCell {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personCommentTitleLabel: UILabel!
    @IBOutlet weak var personCommentDescripTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        personCommentDescripTextView.isScrollEnabled = false
    }
    
    
    func setCommentaryElements(imageUrlString: String, personName: String, commentTitle: String, commentDescription: String){
        if let url = URL(string: imageUrlString){
            personImageView.downloaded(url: url) {}
        }
        personNameLabel.text = personName
        personCommentTitleLabel.text = commentTitle
        personCommentDescripTextView.text = commentDescription
    }

}
