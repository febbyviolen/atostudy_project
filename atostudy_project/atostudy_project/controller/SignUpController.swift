//
//  SignUpController.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/29/23.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var snsView: UIView!
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var snsLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var SNS = ""
    var nickName = ""
    var character = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupData()
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupData() {
        snsLabel.text = SNS
        nickNameLabel.text = nickName
        characterLabel.text = "\(character)"
    }
    
    private func setupUI() {
        logoutButton?.layer.cornerRadius = 16
        logoutButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
}
