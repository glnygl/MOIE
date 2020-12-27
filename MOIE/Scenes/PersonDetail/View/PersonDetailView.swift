//
//  PersonDetailView.swift
//  MOIE
//
//  Created by glnygl on 24.12.2020.
//

import UIKit
import RxRelay

final class PersonDetailView: BaseView {
    var person = BehaviorRelay<Person?>(value: nil)
    var credits = BehaviorRelay<[Credit]?>(value: nil)
    
    let movieCellStaticHeight: CGFloat = 120
    let personCellStaticHeight: CGFloat = 260
    
    let cellSpacing: CGFloat = 6
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(types: [.PersonDetailHeaderCollectionCell, .PersonDetailMoviesCollectionCell])
            let columnLayout = CustomFlowLayout(cellSpacing: cellSpacing)
            collectionView.collectionViewLayout = columnLayout
        }
    }
    
    override func setupView() {
        person.asObservable().subscribe { [weak self] value in
            if self?.person.value != nil {
                self?.reloadCollectionViewData()
            }
        }.disposed(by: Service.shared.disposeBag)
        
        credits.asObservable().subscribe { [weak self] value in
            if self?.credits.value != nil {
                self?.reloadCollectionViewData()
            }
        }.disposed(by: Service.shared.disposeBag)
    }
    
    func reloadCollectionViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension PersonDetailView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if person.value != nil && credits.value != nil {
            return 1 + (credits.value?.count ?? 0)
        } else if person.value != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeue(type: CellType.PersonDetailHeaderCollectionCell.rawValue, indexPath: indexPath) as! PersonDetailHeaderCollectionCell
            cell.person.accept(person.value)
            return cell
        } else {
            let cell = collectionView.dequeue(type: CellType.PersonDetailMoviesCollectionCell.rawValue, indexPath: indexPath) as! PersonDetailMoviesCollectionCell
            cell.credit.accept(credits.value?[indexPath.row - 1])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            let labelHeight = Helpers.estimatedLabelHeight(text: person.value?.biography ?? "", width: collectionView.frame.width - 20, font: Fonts.romanFont(size: 14.0))
            return CGSize(width: collectionView.frame.width, height: personCellStaticHeight + labelHeight)
        } else {
            return CGSize(width: (collectionView.frame.width - 18)/4, height: movieCellStaticHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}


