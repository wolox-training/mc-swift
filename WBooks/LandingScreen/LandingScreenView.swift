//
//  LandingScreenView.swift
//  WBooks
//
//  Created by Megan Cole on 08/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import WolmoCore

class LandingScreenView: UIView, NibLoadable {
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 25
            loginButton.layer.borderWidth = 2
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.setTitle("LOGIN_BUTTON".localized(), for: UIControl.State.normal)
            loginButton.setTitleColor(UIColor.white, for: .normal)
            loginButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 18)
            }
    }
    @IBOutlet weak var footerLabel: UILabel! {
        didSet {
            footerLabel.text = "FOOTER_LABEL".localized()
            footerLabel.font = UIFont.systemFont(ofSize: 12)
        }
    }
}
