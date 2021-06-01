//
//  GoogleOAuthLoginViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation
import GoogleSignIn

class GoogleOAuthLoginViewModel {
    var googleOAuthLoginViewController: GoogleOAuthLoginViewController

    init(googleOAuthLoginViewController: GoogleOAuthLoginViewController) {
        self.googleOAuthLoginViewController = googleOAuthLoginViewController
        GIDSignIn.sharedInstance()?.presentingViewController = googleOAuthLoginViewController

        setupObserverForUser()

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

    deinit {
        removeObserverForUser()
    }
}

// - MARK: Google OAuth methods
extension GoogleOAuthLoginViewModel {
    func doLogOut() {
        GIDSignIn.sharedInstance().signOut()
        DataManager.shared.user = nil
    }
}


// - MARK: Observers for user
extension GoogleOAuthLoginViewModel {
    func setupObserverForUser() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUserLabels),
            name: .userUpdatedKey,
            object: nil)
    }

    func removeObserverForUser() {
        NotificationCenter.default.removeObserver(self)
    }
}


// - MARK: refresh UI methods
extension GoogleOAuthLoginViewModel {
    @objc func updateUserLabels() {
        if let user = DataManager.shared.user {
            googleOAuthLoginViewController.userIdLabel.text = user.userId
            googleOAuthLoginViewController.nameLabel.text = user.name
            googleOAuthLoginViewController.emailLabel.text = user.email
            googleOAuthLoginViewController.tokenLabel.text = user.token
        } else {
            googleOAuthLoginViewController.userIdLabel.text = "-"
            googleOAuthLoginViewController.nameLabel.text = "-"
            googleOAuthLoginViewController.emailLabel.text = "-"
            googleOAuthLoginViewController.tokenLabel.text = "-"
        }
    }
}
