//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 26/08/21.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate:AnyObject {
    func profileHeaderDidTapPostButton( _ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowerButton( _ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton( _ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton( _ header: ProfileInfoHeaderCollectionReusableView)
    
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate:ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postButton:UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton:UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton:UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton:UIButton = {
        let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Joe Smith"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel:UILabel = {
        let label = UILabel()
        label.text = "Sample Bio Just for Testing..."
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubViews(){
        addSubview(profilePhotoImageView)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(postButton)
        addSubview(bioLabel)
        addSubview(nameLabel)
        addSubview(editProfileButton)
    }
    
    private func addButtonActions(){
        followersButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width - 10 - profilePhotoSize)/3
        
        postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        
        followingButton.frame = CGRect(x: postButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        
        followersButton.frame = CGRect(x: followingButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: 5 + buttonHeight , width: countButtonWidth * 3, height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5 , y: 5 + profilePhotoImageView.bottom , width: width - 10 , height: 50).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
            
        bioLabel.frame = CGRect(x: 5 , y: 5 + nameLabel.bottom , width: width - 10 , height: bioLabelSize.height).integral
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func didTapFollowerButton(){
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    
    @objc private func didTapFollowingButton(){
       
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostButton(){
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
