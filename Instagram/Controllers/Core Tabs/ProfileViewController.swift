//
//  ProfileViewController.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 29/11/20.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNaviagtionBar()
    }
    private func configureNaviagtionBar(){
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingsButton))
    }

    @objc private func didTapSettingsButton(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }

}
