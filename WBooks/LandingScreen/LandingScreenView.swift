//
//  LandingScreenView.swift
//  WBooks
//
//  Created by Megan Cole on 08/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import SwiftUI
import WolmoCore

class LandingScreenView: UIView, NibLoadable {
    @IBAction func loginWithGoogle(_ sender: UIButton) {
        print("LOGIN WITH GOOGLE")
        let mainMenuController = MainMenuController()
        present(mainMenuController, animated: true)
    }
    
    @objc func signIn() {
        print("Hello Wolox!")
        let mainViewController = MainMenuController()
        present(mainViewController, animated: true)
    }

    func setAction() {
        _view.signInGoogleButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 25
            loginButton.layer.borderWidth = 2
            loginButton.layer.borderColor = UIColor.white.cgColor
        }
    }
}
