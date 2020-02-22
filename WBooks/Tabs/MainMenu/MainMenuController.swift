//
//  MainMenuController.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainMenuController: BaseViewController {
    private let _view: MainMenuView = MainMenuView.loadFromNib()!
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
        title = "LIBRARY"
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "MAIN_MENU_NAV_BAR_TITLE".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_notifications"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_search"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
}

// MARK: - UITableViewDelegate
extension MainMenuController: UITableViewDelegate {
    func tableView(_ booksTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
    }

    func tableView(_ booksTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = _view.booksTable.dequeueReusableCell(withIdentifier: MainMenuController.cellIdentifier) as? BookCell else { return UITableViewCell() }
        let book = booksArray[indexPath.row]

        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        cell.bookCover.image = book.cover

        return cell
    }
    
    func tableView(_ booksTable: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource
extension MainMenuController: UITableViewDataSource {
    private func configureBooksTable() {
        booksArray = createBooksArray()
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: MainMenuController.cellIdentifier)
        _view.booksTable.rowHeight = UITableView.automaticDimension
        _view.booksTable.showsVerticalScrollIndicator = false
    }
    
    private func createBooksArray() -> [Book] {
        var books: [Book] = []
        books.append(Book(title: "A Little Bird Told Me", author: "Timothy Cross", cover: #imageLiteral(resourceName: "img_book1")))
        books.append(Book(title: "When The Doves Disappeared", author: "Sofi Oksanen", cover: #imageLiteral(resourceName: "img_book2")))
        books.append(Book(title: "The Best Book In The World", author: "Peter Sjernstrom", cover: #imageLiteral(resourceName: "img_book3")))
        books.append(Book(title: "Be Creative", author: "Tony Alcazar", cover: #imageLiteral(resourceName: "img_book4")))
        books.append(Book(title: "Redesign The Web", author: "Liliana Castilla", cover: #imageLiteral(resourceName: "img_book5")))
        books.append(Book(title: "The Yellow Book", author: "Big bird", cover: #imageLiteral(resourceName: "img_book6")))

        return books
    }
}
