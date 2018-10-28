//
//  MainMenuViewController.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var tasksCollectionView: UICollectionView!
    
    private lazy var viewModel = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksCollectionView.delegate = self
        tasksCollectionView.dataSource = self
        
        let nib = UINib(nibName: String(describing: TaskCell.self), bundle: nil)
        tasksCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: TaskCell.self))
        
        viewModel.fetchDelegate = self
        viewModel.errorDelegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        viewModel.fetchAllTasks()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if let layout =  self.tasksCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            if layout.scrollDirection == .horizontal {
                layout.scrollDirection = .vertical
            }else{
                layout.scrollDirection = .horizontal
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPlaceDetails") {
            let detailsController: PlaceDetailViewController = segue.destination as! PlaceDetailViewController
            if let selectedIndexPath = tasksCollectionView.indexPathsForSelectedItems?.first{
                let place = viewModel.task(for: selectedIndexPath.row)
                detailsController.placeName = place ?? ""
            }
            
        }
    }
    
}

extension MainMenuViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfTasks()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let taskCell = tasksCollectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let title = viewModel.task(for: indexPath.row)
        taskCell.setup(title: title)
        
        return taskCell
    }
    
    
}

extension MainMenuViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlaceDetails", sender: self)
    }
}

extension MainMenuViewController: TaskFetchDelegate{
    
    func loadData() {
        DispatchQueue.main.async {
            self.tasksCollectionView.reloadData()
        }
    }
}

extension MainMenuViewController: ErrorAlertDelegate{
    
    func alertError(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController.alertUser(msg) { (action) in
                self.viewModel.fetchAllTasks()
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
}

