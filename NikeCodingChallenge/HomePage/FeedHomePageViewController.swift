//
//  FeedHomePageViewController.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeedHomePageViewController: UIViewController {
    
    private var viewModel = HomePageViewModel()
    private var feedTableView = UITableView()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupTableView()
        setConstraints()
    
    }
    
    private func loadData() {
        
        viewModel.albumData.bind(to: feedTableView.rx.items(cellIdentifier: AlbumTableViewCell.reuseIdentifier, cellType: AlbumTableViewCell.self)) {  (row,item,cell) in
            cell.setCell(with: item)
        }.disposed(by: disposeBag)
        
        viewModel.loadData()
        
    }

    private func setupTableView() {

        feedTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseIdentifier)
        feedTableView.estimatedRowHeight = 200
        feedTableView.rowHeight = UITableView.automaticDimension
        
        feedTableView.rx.itemSelected
        .subscribe(onNext: { [weak self] indexPath in
          let cell = self?.feedTableView.cellForRow(at: indexPath) as? AlbumTableViewCell
            
            if let albulm = cell?.model {
                self?.goToDetailVC(album: albulm)
            }
        }).disposed(by: disposeBag)
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

