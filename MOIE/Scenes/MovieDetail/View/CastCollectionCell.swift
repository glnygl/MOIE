//
//  CastCollectionCell.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import UIKit

class CastCollectionCell: UICollectionViewCell {
    
    var actor: Actor? {
        didSet {
            configureCell()
        }
    }
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        coverImage.layer.cornerRadius = 20.0
    }
    
    override func prepareForReuse() {
        coverImage.cancelImageRequest()
        coverImage.image = nil
    }
    
    func configureCell() {
        nameLabel.text = actor?.name
        characterLabel.text = actor?.character
        if let coverString = actor?.cover {
            let imageRequest = ImageRequest(imageUrl: coverString)
            if coverImage.isImageNotCashed(request: imageRequest) {
                coverImage.setImage(request: imageRequest)
            }
        } else {
            coverImage.image = UIImage(named: "noPersonImage")
        }
    }

}
