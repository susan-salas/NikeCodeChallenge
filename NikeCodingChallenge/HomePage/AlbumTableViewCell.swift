//
//  AlbumTableViewCell.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "AlbumTableViewCell"
    
    private var albumImageView = UIImageView()
    private var albumNameLabel = UILabel()
    private var artistNameLabel = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let labelsStackView = UIStackView(arrangedSubviews: [albumNameLabel, artistNameLabel])
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        labelsStackView.alignment = .leading
        labelsStackView.spacing = 5
        
        let stackView = UIStackView(arrangedSubviews: [albumImageView, labelsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.horizontal)
        labelsStackView.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.horizontal)
        
        let constraints:[NSLayoutConstraint] = [
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            albumImageView.heightAnchor.constraint(equalToConstant: 100),
            albumImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setCell(with album: Album) {
        
        albumImageView.loadImage(from: album.artworkUrl100 ?? "")
        albumNameLabel.text = album.name
        artistNameLabel.text = album.artistName
    }

}
