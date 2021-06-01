//
//  GoogleOAuthLoginViewController.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import UIKit

class GoogleOAuthLoginViewController: UIViewController {
    var googleOAuthLoginViewModel: GoogleOAuthLoginViewModel?

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.googleOAuthLoginViewModel = GoogleOAuthLoginViewModel(googleOAuthLoginViewController: self)
    }


    @IBAction func logoutAction(_ sender: Any) {
        googleOAuthLoginViewModel?.doLogOut()
    }
}
