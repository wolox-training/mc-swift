//
//  LibraryController.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LibraryController: BaseViewController {
    private let _view: LibraryView = LibraryView.loadFromNib()!
    private var booksArray: [Book] = []
    private static let cellIdentifier = "BookCell"
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }

    init() {
        super.init(nibName: .none, bundle: .none)
    }

    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let book = booksArray[indexPath.row]

        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        cell.bookCover.image = book.cover

        return cell
    }

    func tableView(_ booksTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
    }
}

// MARK: - Private
extension LibraryController {
    private func configureBooksTable() {
        booksArray = createBooksArray()
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: LibraryController.cellIdentifier)
        _view.booksTable.rowHeight = UITableView.automaticDimension
        _view.booksTable.showsVerticalScrollIndicator = false
    }
    
    private func createBooksArray() -> [Book] {
        var books: [Book] = []
        books.append(Book(title: "A Little Bird Told Me", author: "Timothy Cross", cover: UIImage.book1))
        books.append(Book(title: "When The Doves Disappeared", author: "Sofi Oksanen", cover: UIImage.book2))
        books.append(Book(title: "The Best Book In The World", author: "Peter Sjernstrom", cover: UIImage.book3))
        books.append(Book(title: "Be Creative", author: "Tony Alcazar", cover: UIImage.book4))
        books.append(Book(title: "Redesign The Web", author: "Liliana Castilla", cover: UIImage.book5))
        books.append(Book(title: "The Yellow Book", author: "Big bird", cover: UIImage.book6))

        return books
    }
}
