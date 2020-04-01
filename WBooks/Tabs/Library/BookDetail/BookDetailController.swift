//
//  BookDetailController.swift
//  WBooks
//
//  Created by Megan Cole on 16/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Kingfisher

class BookDetailController: BaseViewController {
    private let _view: BookDetailView = BookDetailView.loadFromNib()!
    private let _bookDetailView: BookDetailCell = BookDetailCell.loadFromNib()!
    private var _viewModel: BookDetailViewModel
    private static let cellIdentifier = "CommentCell"

    init(viewModel: BookDetailViewModel) {
        _viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        _view.bookDetailCell.addSubview(_bookDetailView)
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailTable()
        configureViewModel()
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationItem.title = "BOOK_DETAIL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.back, style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToPreviousView))
    }
    
    @objc func goToPreviousView() {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _bookDetailView.setup(book: _viewModel.book)
    }

    // MARK: - Private
    private func configureDetailTable() {
        _view.detailTable.delegate = self
        _view.detailTable.dataSource = self
        _view.detailTable.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: BookDetailController.cellIdentifier)
        _view.detailTable.showsVerticalScrollIndicator = false
        }

    private func configureViewModel() {
        _viewModel.onUpdate = { [weak self] () in
            DispatchQueue.main.async {
                self?._view.detailTable.reloadData()
            }
        }
        _viewModel.getComments()
    }
}

// MARK: - UITableViewDataSource
extension BookDetailController: UITableViewDataSource {
    func tableView(_ detailTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.numberOfCells()
    }

    func tableView(_ detailTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CommentCell = _view.detailTable.dequeueReusableCell(withIdentifier: BookDetailController.cellIdentifier) as? CommentCell else { return UITableViewCell() }
        let comment = _viewModel.getCellComment(at: indexPath)

        cell.username.text = comment.user.username
        cell.content.text = comment.content
        if let url = URL(string: comment.user.avatar) {
            let resource = ImageResource(downloadURL: url)
            cell.avatar.kf.indicatorType = .activity
            cell.avatar.kf.setImage(with: resource, placeholder: UIImage.book5)
        } else {
            cell.avatar.image = UIImage.book1
        }
        
        return cell
    }

}

// MARK: - UITableViewDelegate
extension BookDetailController: UITableViewDelegate {
    func tableView(_ detailTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailTable.deselectRow(at: indexPath, animated: true)
    }
}
