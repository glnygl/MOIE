//
//  MainView.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit

protocol MainViewDelegate: class {
    func refreshData()
}

final class MainView: BaseView {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyStateView: EmptyStateView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(types: [.MovieCollectionCell])
            collectionView.register(UINib(nibName: CellType.MainCollectionReusableView.rawValue, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellType.MainCollectionReusableView.rawValue)
        }
    }
    
    weak var delegate: MainViewDelegate?
    let mimimumSpacing: CGFloat = 0
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.isHidden = false
                self?.collectionView.reloadData()
            }
        }
    }
    
    func startIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.isHidden = false
            self?.loadingIndicator.startAnimating()
        }
    }
    
    func stopIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
        }
    }

    override func setupView() {
        emptyStateView.isHidden = true
        emptyStateView.delegate = self
    }
    
    func showError(errorString: String) {
        DispatchQueue.main.async { [weak self] in
            self?.emptyStateView.isHidden = false
            self?.collectionView.isHidden = true
            self?.emptyStateView.text = errorString.localize()
        }
    }
    
}

extension MainView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(type: CellType.MovieCollectionCell.rawValue, indexPath: indexPath) as! MovieCollectionCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = Helpers.estimatedLabelHeight(text: movies[indexPath.row].title ?? "", width: (collectionView.frame.width / 2) - 20, font: Fonts.heavyFont(size: 14.0))
        return CGSize(width: (collectionView.frame.width / 2), height: 320 + size )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                       viewForSupplementaryElementOfKind kind: String,
                       at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellType.MainCollectionReusableView.rawValue, for: indexPath)
            return headerView
        }
        
        return UICollectionReusableView()
      
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailController = MovieDetailViewController()
        if let view = movieDetailController.view as? MovieDetailView {
            view.movie = movies[indexPath.row]
        }
        movieDetailController.viewModel.movie = movies[indexPath.row]
        Helpers.topViewController()?.navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return mimimumSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return mimimumSpacing
    }
}

extension MainView: EmptyStateDelegate {
    func refresh() {
        delegate?.refreshData()
    }
}
