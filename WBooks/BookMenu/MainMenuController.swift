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
    
    @IBOutlet weak var booksTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 100
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
    }

}
