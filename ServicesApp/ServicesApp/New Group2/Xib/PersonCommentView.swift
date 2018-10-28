//
//  PersonCommentView.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class PersonCommentView: UIView {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personCommentTitleLabel: UILabel!
    @IBOutlet weak var personCommentDescripTextView: UITextView!{
        didSet{
            personCommentDescripTextView.adjustUITextViewHeight(arg: personCommentDescripTextView)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commomInit()
    }
    
    func instanceFromNib() -> UIView {
        return UINib(nibName: "PersonCommentView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    private func commomInit(){
        let view = instanceFromNib()
        self.addSubview(view)
        
        view.backgroundColor = .clear
        personCommentDescripTextView.isScrollEnabled = false
    }
    
    

}
