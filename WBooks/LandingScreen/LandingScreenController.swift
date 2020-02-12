//
//  LandingScreenController.swift
//  WBooks
//
//  Created by Megan Cole on 08/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LandingScreenController: UIViewController {
    private let _view: LandingScreenView = LandingScreenView.loadFromNib()!
    
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
        _view.loginButton.addTarget(self, action: #selector(loginWithGoogle), for: .touchUpInside)
    }

    @objc private func loginWithGoogle() {
        self.navigationController?.pushViewController(MainMenuController(), animated: true)
    }
}
