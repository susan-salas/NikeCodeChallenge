//
//  DetailPageViewController.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {
    
    private var viewModel:DetailPageViewModel
    
    private var albumImageView = UIImageView()
    private var albumNameLabel = UILabel()
    private var artistNameLabel = UILabel()
    private var genreLabel = UILabel()
    private var releaseDateLabel = UILabel()
    private var copyRightInfoLabel = UILabel()
    private var itunesButton = UIButton()
    
    init(viewModel: DetailPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonAttributes()
        setCopyrightLabelAttributes()
        setConstraints()
        setViewData()
        self.view.backgroundColor = UIColor.white
    }
    
    func setViewData() {
        albumImageView.loadImage(from: viewModel.albumImage)
        albumNameLabel.text = viewModel.albumName
        artistNameLabel.text = viewModel.artistName
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
        copyRightInfoLabel.text = viewModel.copyRightInfo
    }
    
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [albumImageView, albumNameLabel, artistNameLabel, genreLabel, releaseDateLabel, copyRightInfoLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        
        itunesButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(itunesButton)
        
        let subViewConstraints:[NSLayoutConstraint] = [
            itunesButton.heightAnchor.constraint(equalToConstant: 42),
            itunesButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            itunesButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            itunesButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            albumImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            albumImageView.heightAnchor.constraint(equalTo: self.view.widthAnchor)
        ]
        NSLayoutConstraint.activate(subViewConstraints)
    }
    
    private func setButtonAttributes() {
        itunesButton.backgroundColor = UIColor.systemTeal
        itunesButton.setTitle("Open in iTunes", for: .normal)
        itunesButton.addTarget(self, action: #selector(goToAlbumsiTunesStore), for: .touchUpInside)
    }
    
    private func setCopyrightLabelAttributes() {
        copyRightInfoLabel.numberOfLines = 0
        copyRightInfoLabel.lineBreakMode = .byWordWrapping
    }
    
    @objc private func goToAlbumsiTunesStore() {
        if let appURL = URL(string: viewModel.getItunesLink()) {
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }else {
                guard let url = URL(string: viewModel.albumURL) else { return }
                UIApplication.shared.open(url)
            }
        }
    }
}
