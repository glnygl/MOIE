//
//  MovieCollectionCell.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//
import Alamofire
import AlamofireImage

class MovieCollectionCell: UICollectionViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var genreView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    
    
    var movie: Movie? {
        didSet {
            configureCell()
        }
    }
    
    override func prepareForReuse() {
        coverImage.cancelImageRequest()
        coverImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        genreView.layer.cornerRadius = 4.0
        coverImage.layer.cornerRadius = 20.0
        imageContainerView.giveShadow()
        genreView.giveBorder(width: 1, color: UIColor.black)
    }
    
    func configureCell() {
        
        if let genreId = movie?.genres.first {
            if let genre = Genres.getGenre(id: genreId ?? -1) {
                genreLabel.text = genre
                genreViewWidthConstraint.constant = genreLabel.intrinsicContentSize.width + 20
            }
        }
        titleLabel.text = movie?.title
        titleLabel.sizeToFit()
        ratingLabel.text = String(movie?.rating ?? 0)
        let imageRequest = ImageRequest(imageUrl: movie?.cover ?? "")
        if coverImage.isImageNotCashed(request: imageRequest) {
            coverImage.setImage(request: imageRequest)
        }
    }
}
