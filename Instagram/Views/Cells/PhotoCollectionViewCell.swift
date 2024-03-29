//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 26/08/21.
//

import UIKit
import SDWebImage
class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "user post image"
        accessibilityHint = "Double tap to open"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model:UserPost){
        let url = model.thumbnailImage
        // low performace so we are using a framework to handle caching : pod 'SDWebImage'
//        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _ , _ in
//            photoImageView.image = UIImage(data: data!)
//
//        })
        
        photoImageView.sd_setImage(with: url, completed: nil)
        
        
    }
    
    public func configure(debug imageName:String){
        photoImageView.image = UIImage(named: imageName)
    }
}
