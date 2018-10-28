//
//  CommentariesCollectionXIB.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

private let reuseIdentifier = "commentaryCell"

class CommentariesCollectionXIB: UICollectionViewController {
    
    private lazy var viewModel = CommentariesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(CommentaryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        viewModel.refreshDelegate = self
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCommentaries()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CommentaryCell
        let commentForIndex = viewModel.comment(for: indexPath.row)
        cell.setCommentaryElements(imageUrlString: commentForIndex?.urlFoto ?? "",
                                   personName: commentForIndex?.nome ?? "",
                                   commentTitle: commentForIndex?.titulo ?? "",
                                   commentDescription: commentForIndex?.comentario ?? "")
        return cell
    }
    
}

extension CommentariesCollectionXIB: DataRefresh{
    
    func loadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


