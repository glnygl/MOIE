//
//  MovieDetailCastTableCell.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import UIKit

class MovieDetailCastTableCell: UITableViewCell {
    
    var actors: [Actor]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(types: [.CastCollectionCell])
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension MovieDetailCastTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(type: CellType.CastCollectionCell.rawValue, indexPath: indexPath) as! CastCollectionCell
        cell.actor = actors?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let personDetailViewController = PersonDetailViewController()
        personDetailViewController.viewModel.personId = actors?[indexPath.row].id
        Helpers.topViewController()?.navigationController?.pushViewController(personDetailViewController, animated: true)
    }
    
}
