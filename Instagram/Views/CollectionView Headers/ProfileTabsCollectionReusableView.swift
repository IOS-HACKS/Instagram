//
//  ProfileTabsCollectionReusableView.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 26/08/21.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate:AnyObject {
    
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()
    
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    public weak var delegate:ProfileTabsCollectionReusableViewDelegate?
    
    struct Contants {
        static let padding: CGFloat = 8
    }
    
    
    private let grideButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(taggedButton)
        addSubview(grideButton)
        grideButton.addTarget(self, action: #selector(didTapGridButtonTab), for: .touchUpInside)
        taggedButton.addTarget(self, action: #selector(didTapTaggedButtonTab), for: .touchUpInside)
    }
    
    @objc private func didTapGridButtonTab(){
        grideButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapTaggedButtonTab(){
        taggedButton.tintColor = .systemBlue
        grideButton.tintColor = .lightGray
        delegate?.didTapTaggedButtonTab()
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = height - (Contants.padding * 2)
        let gridButtonX = (width/2 - size)/2
        
        grideButton.frame = CGRect(x: gridButtonX , y: Contants.padding, width: size, height: size)
        taggedButton.frame = CGRect(x: gridButtonX +  (width/2), y: Contants.padding, width: size, height: size)
       
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
