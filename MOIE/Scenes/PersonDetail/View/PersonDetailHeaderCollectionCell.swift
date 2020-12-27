//
//  PersonDetailHeaderCollectionCell.swift
//  MOIE
//
//  Created by glnygl on 27.12.2020.
//

import UIKit
import RxRelay

class PersonDetailHeaderCollectionCell: UICollectionViewCell {
    
    var person = BehaviorRelay<Person?>(value: nil)
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobView: UIView!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderIcon: UIImageView!
    @IBOutlet weak var biographyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        subcribe()
    }
    
    override func prepareForReuse() {
        coverImage.cancelImageRequest()
        coverImage.image = nil
    }
    
    func setupView() {
        imageContainerView.giveShadow()
        coverImage.layer.cornerRadius = 20.0
        jobView.giveBorder(width: 1, color: UIColor.black)
        jobView.layer.cornerRadius = 4.0
    }
    
    func subcribe() {
        person.asObservable().subscribe { [weak self] (_) in
            guard let person = self?.person.value else { return }
            self?.configureCell(person: person)
        }.disposed(by: Service.shared.disposeBag)
    }
    
    func configureCell(person: Person) {
        nameLabel.text = person.name
        jobLabel.text = person.job
        switch person.gender {
        case 1:
            genderIcon.image = UIImage(named: "female")
        default:
            genderIcon.image = UIImage(named: "male")
        }
        
        if let cover = person.cover {
            let imageRequest = ImageRequest(imageUrl: cover)
            if coverImage.isImageNotCashed(request: imageRequest) {
                coverImage.setImage(request: imageRequest)
            }
        } else {
            coverImage.image = UIImage(named: "noPersonImage")
        }
        if let age = Helpers.getAge(date: person.birthday) {
            ageLabel.text = String.init(format: LocalizableStrings.PersonDetail.age, "\(age)")
            ageLabel.changeTextFont(text: "\(age)", font: Fonts.romanFont(size: 14.0))
        }
        biographyLabel.text = person.biography
    }
}

