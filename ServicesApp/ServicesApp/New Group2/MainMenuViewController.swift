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
        if (segue.identifier == "showTaskDetails") {
//            let detailsController: DetailsViewController = segue.destination as! DetailsViewController
//            if let selectedIndexPath = tasksCollectionView.indexPathsForSelectedItems?.first{
//                let data = viewModel.hero(for: selectedIndexPath.row)
//                let cell = collectionView(tasksCollectionView, cellForItemAt: selectedIndexPath) as! HeroCell
//                detailsController.heroId = data?.id ?? 0
//                detailsController.heroName = data?.name ?? ""
//                detailsController.heroImage = cell.heroImageView.image ?? UIImage(named: "marvel_logo")!
//                detailsController.heroDescription = data?.description ?? ""
//            }
            
        }
    }
}

extension MainMenuViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfTasks()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let heroCell = tasksCollectionView.dequeueReusableCell(withReuseIdentifier: "taskCell", for: indexPath) as! TaskCell
        let data = viewModel.task(for: indexPath.row)
        heroCell.setup(imageURL: data?.thumbnail)
        
        return heroCell
    }
    
    
}

extension MainMenuViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCharacterDetails", sender: self)
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
        let alert = UIAlertController.alertUser(msg) { (action) in
            self.viewModel.fetchAllHeroes()
        }
        self.present(alert, animated: true, completion: nil)
    }
}

