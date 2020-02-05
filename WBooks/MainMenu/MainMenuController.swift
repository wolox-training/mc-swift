//
//  MainMenuController.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let _view: MainMenuView = MainMenuView.loadFromNib()!
    var booksArray: [Book] = []
    
    func tableView(_ booksTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
    }

    func tableView(_ booksTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _view.booksTable.dequeue(cell: BookCell.self)!
        let book = booksArray[indexPath.row]

        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        cell.bookCover.image = book.cover

        return cell
    }
    
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
    }
    
    private func configureBooksTable() {
        booksArray = createBooksArray()
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(cell: BookCell.self)
        _view.booksTable.rowHeight = UITableView.automaticDimension
    }
    
    private func createBooksArray() -> [Book] {
        var books: [Book] = []
        books.append(Book(title: "A little bird told me", author: "Timothy Cross", cover: #imageLiteral(resourceName: "img_book1")))
        books.append(Book(title: "When the doves lalala lala lalal lallalal disappeared", author: "Sofi Oksanen", cover: #imageLiteral(resourceName: "img_book2")))
        books.append(Book(title: "The best book in the world", author: "Peter Sjernstrom", cover: #imageLiteral(resourceName: "img_book3")))
        books.append(Book(title: "Be creative", author: "Tony Alcazar", cover: #imageLiteral(resourceName: "img_book4")))
        books.append(Book(title: "Redesign the web", author: "Liliana Castilla", cover: #imageLiteral(resourceName: "img_book5")))
        books.append(Book(title: "The yellow book", author: "Big bird", cover: #imageLiteral(resourceName: "img_book6")))

        return books
    }

}
