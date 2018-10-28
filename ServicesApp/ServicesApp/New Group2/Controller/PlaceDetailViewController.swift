//
//  PlaceDetailViewController.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var streetNameLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!{
        didSet{
            descriptionTextView.adjustUITextViewHeight(arg : descriptionTextView)
        }
    }
    
    @IBOutlet weak var personCommentView: PersonCommentView!
    
    @IBOutlet weak var addressPointView: UIView!{
        didSet{
            addressPointView.roundedView()
        }
    }
    
    @IBOutlet weak var favoritesImageView: UIImageView!{
        didSet{
            addressPointView.roundedView()
        }
    }
    
    private lazy var viewModel = PlaceDetailsViewModel()
    private lazy var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var placeName: String = "ultimo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityIndicator = UIViewController.displaySpinner(onView: self.view)
        
        viewModel.fetchPlaceData(placeIdString: placeName) {
            self.setDownloadedData()
            UIViewController.removeSpinner(spinner: activityIndicator)
        }
        
        addSearchNavigationItem()
        addNavigationBarTitleLabel()
        addStyleToNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        appDelegate?.enableAllOrientation = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate?.enableAllOrientation = true
    }
    
    @IBAction func callNumberAction(_ sender: UIButton) {
    }
    
    @IBAction func goToServicesScreen(_ sender: UIButton) {
    
    }

    
    @IBAction func addressButtonPressed(_ sender: UIButton) {
        UIAlertController.alertUser("Endereço aqui")
    }
    
    @IBAction func commentariesButtonPressed(_ sender: UIButton) {
        let yOffSet = CGPoint(x: self.view.frame.minX, y: personCommentView.frame.minY)
        self.scrollView.setContentOffset(yOffSet, animated: true)
    }
    
    private func setDownloadedData(){
        DispatchQueue.main.async {
            self.cityNameLabel.text = self.viewModel.cityName
            self.streetNameLabel.text = self.viewModel.neighborhoodName
            self.descriptionTextView.text = self.viewModel.placeDescription
            self.placeImageView.downloaded(from: self.viewModel.placePhotoURL)
            
        }
    }
    
    func addStyleToNavigationBar(){
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7978799939, green: 0.5400934219, blue: 0.09848291427, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func addNavigationBarTitleLabel(){
        
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            let firstLabel = UILabel(frame: firstFrame)
            
            let imageAttachment =  NSTextAttachment()
            imageAttachment.image = UIImage(named:"ENDERECO-POINT")
            imageAttachment.image = imageAttachment.image?.imageWithColor(color: .white)
            //Set bound to reposition
            let imageOffsetY:CGFloat = -4.5;
            imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 35, height: 35)
            //Create string with attachment
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            //Initialize mutable string
            let completeText = NSMutableAttributedString(string: "")
            //Add image to mutable string
            completeText.append(attachmentString)
            //Add your text to mutable string
            let textAfterIcon = NSMutableAttributedString(string: "Porto Alegre - Moinhos de Vento")
            completeText.append(textAfterIcon)
            firstLabel.textAlignment = .center
            firstLabel.attributedText = completeText
            firstLabel.adjustsFontSizeToFitWidth = true
            firstLabel.textColor = .white
            
            navigationItem.titleView = firstLabel
        }
    
    }
    
    func addSearchNavigationItem(){
        let searchImage = UIImage(named: "ICONE PESQUISA")
        let rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(PlaceDetailViewController.searchPressed))
        rightBarButtonItem.tintColor = .white
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
        
    }
    
    @objc func searchPressed(){
        
    }
    
}
