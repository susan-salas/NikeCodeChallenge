//
//  FeedHomePageViewController.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import UIKit

class FeedHomePageViewController: UIViewController {
    
    private var viewModel = HomePageViewModel()
    private var feedTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupTableView()
        setConstraints()
    
    }
    
    private func loadData() {
        viewModel.loadData()
        viewModel.albumData.subscribe(observer: self) { (newAlbum, _) in
            DispatchQueue.main.async {
            self.feedTableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseIdentifier)
        feedTableView.estimatedRowHeight = 200
        feedTableView.rowHeight = UITableView.automaticDimension
    }
    private func setConstraints() {
        
        self.view.addSubview(feedTableView)
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints:[NSLayoutConstraint] = feedTableView.constraintsForAnchoringTo(boundsOf: self.view)
            
        NSLayoutConstraint.activate(constraints)
    }
    
    private func goToDetailVC(album: Album) {
        let detailVM = DetailPageViewModel.init(with: album)
        let detailVC = DetailPageViewController.init(viewModel: detailVM)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension FeedHomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseIdentifier, for: indexPath) as? AlbumTableViewCell {
            cell.setCell(with: viewModel.albumData.value[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

extension FeedHomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToDetailVC(album: viewModel.albumData.value[indexPath.row])
    }
    
}
