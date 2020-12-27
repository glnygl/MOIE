//
//  MovieDetailHeaderTableCell.swift
//  MOIE
//
//  Created by glnygl on 26.12.2020.
//

import UIKit

class MovieDetailHeaderTableCell: UITableViewCell {
    
    var movie: Movie? {
        didSet {
            configureCell()
        }
    }

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreView: UIView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        coverImage.cancelImageRequest()
        coverImage.image = nil
    }
    
    func setupView() {
        genreView.layer.cornerRadius = 4.0
        coverImage.layer.cornerRadius = 20.0
        imageContainerView.giveShadow()
        genreView.giveBorder(width: 1, color: UIColor.black)
    }
    
    func configureCell() {
        titleLabel.text = movie?.title
        overviewLabel.text = movie?.overview
        ratingLabel.text = String(movie?.rating ?? 0)
        if let genreId = movie?.genres.first {
            genreLabel.text = Genres.getGenre(id: genreId ?? -1)
        }
        let imageRequest = ImageRequest(imageUrl: movie?.cover ?? "")
        if coverImage.isImageNotCashed(request: imageRequest) {
            coverImage.setImage(request: imageRequest)
        }
        if let date = movie?.date, let formatedDate = Helpers.formatDate(date: date) {
            dateLabel.text = String.init(format: LocalizableStrings.PersonDetail.date, String(describing: formatedDate))
            dateLabel.changeTextFont(text: String(describing: formatedDate), font: Fonts.romanFont(size: 12.0))
        }
    }
}
