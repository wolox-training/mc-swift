//
//  LibraryController.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Kingfisher

class LibraryController: BaseViewController {
    private let _view: LibraryView = LibraryView.loadFromNib()!
    private var _viewModel: LibraryViewModel
    private static let cellIdentifier = "BookCell"
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }

    init(viewModel: LibraryViewModel) {
        _viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }

    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _viewModel.onUpdate = { [weak self] () in
            DispatchQueue.main.async {
                self?._view.booksTable.reloadData()
            }
        }
        _viewModel.getBookList()
        configureBooksTable()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "LIBRARY_NAV_BAR_TITLE".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
}

// MARK: - UITableViewDelegate
extension LibraryController: UITableViewDelegate {
    func tableView(_ booksTable: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource
extension LibraryController: UITableViewDataSource {
    func tableView(_ booksTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = _view.booksTable.dequeueReusableCell(withIdentifier: LibraryController.cellIdentifier) as? BookCell else { return UITableViewCell() }
        let book = _viewModel.books[indexPath.row]

        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        if let url = URL(string: book.image) {
            let resource = ImageResource(downloadURL: url)
            cell.bookCover.kf.indicatorType = .activity
            cell.bookCover.kf.setImage(with: resource, placeholder: UIImage.cover_unavailable)
        } else {
            cell.bookCover.image = UIImage.cover_unavailable
        }

        return cell
    }

    func tableView(_ booksTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        _viewModel.numberOfCells()
    }
}

// MARK: - Private
extension LibraryController {
    private func configureBooksTable() {
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: LibraryController.cellIdentifier)
        _view.booksTable.rowHeight = UITableView.automaticDimension
        _view.booksTable.showsVerticalScrollIndicator = false
    }
}
