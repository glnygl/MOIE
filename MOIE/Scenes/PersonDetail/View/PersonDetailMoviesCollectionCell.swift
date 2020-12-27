//
//  PersonDetailMoviesCollectionCell.swift
//  MOIE
//
//  Created by glnygl on 27.12.2020.
//

import UIKit
import RxRelay

class PersonDetailMoviesCollectionCell: UICollectionViewCell {
    
    var credit = BehaviorRelay<Credit?>(value: nil)
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func prepareForReuse() {
        coverImage.cancelImageRequest()
        coverImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImage.layer.cornerRadius = 20.0
        subcribe()
    }
    
    func subcribe() {
        credit.asObservable().subscribe { [weak self] (_) in
            guard let credit = self?.credit.value else { return }
            if let coverString = credit.cover {
                self?.setImage(coverString: coverString)
            } else {
                self?.coverImage.image = UIImage(named: "noImage")
            }
        }.disposed(by: Service.shared.disposeBag)
    }
    
    func setImage(coverString: String) {
        let imageRequest = ImageRequest(imageUrl:coverString)
        if coverImage.isImageNotCashed(request: imageRequest) {
            coverImage.setImage(request: imageRequest)
        }
    }

}
