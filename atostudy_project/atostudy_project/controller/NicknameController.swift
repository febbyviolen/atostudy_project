//
//  NicknameController.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/26/23.
//

import UIKit

class NicknameController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backButton: UINavigationItem!
    @IBOutlet weak var nickNameTextField: UITextField!
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Spoqa Han Sans Neo Bold", size: 16)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "primary 900")
        return button
    }()
    
    var nickNameBorderLine = CALayer()
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nickNameTextField.delegate = self
        setupUI()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc func nextButtonTapped() {
        
    }
                                  
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupUI(){
        keyboardNotShownUI()
        textFieldNotOk()
        setupButtonUI()
        setupTextField()
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 1
            && textField.text?.count ?? 0 < 13   {
            textFieldNotOk()
        } else {
            textFieldIsOk()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardShownUI()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardNotShownUI()
    }
    
    private func setupButtonUI() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 56),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -16)
            
        ])
    }
    
    private func setupTextField() {
        if let clearButton = nickNameTextField.value(forKeyPath: "_clearButton") as? UIButton {
            nickNameTextField.tintColor = UIColor(named: "primary 900")
            let configuration = UIImage.SymbolConfiguration(textStyle: .body)
            let img = UIImage(systemName: "xmark", withConfiguration: configuration)
            
            clearButton.setImage(img, for: .normal)
            clearButton.tintColor = UIColor(named: "black 700")
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        self.navigationController?.navigationBar.tintColor = UIColor(named: "black 900")
    }
    
    private func keyboardNotShownUI() {
        nickNameBorderLine.frame = CGRect(x: 0, y: nickNameTextField.frame.height + 8, width: nickNameTextField.frame.width, height: 2)
        nickNameBorderLine.backgroundColor = UIColor(named: "black 400")?.cgColor
        nickNameTextField.borderStyle = UITextField.BorderStyle.none
        nickNameTextField.layer.addSublayer(nickNameBorderLine)
    }
    
    private func keyboardShownUI() {
        nickNameBorderLine.frame = CGRect(x: 0, y: nickNameTextField.frame.height + 8, width: nickNameTextField.frame.width, height: 2)
        nickNameBorderLine.backgroundColor = UIColor(named: "primary 900")?.cgColor
        nickNameTextField.borderStyle = UITextField.BorderStyle.none
        nickNameTextField.layer.addSublayer(nickNameBorderLine)
    }
    
    private func textFieldIsOk() {
        nextButton.layer.cornerRadius = 16
        nextButton.titleLabel?.font = UIFont(name: "Spoqa Han Sans Neo Bold", size: 16)
        nextButton.titleLabel?.textColor = .white
        nextButton.backgroundColor = UIColor(named: "black 500")
    }
    
    private func textFieldNotOk() {
        nextButton.layer.cornerRadius = 16
        nextButton.titleLabel?.font = UIFont(name: "Spoqa Han Sans Neo Bold", size: 16)
        nextButton.titleLabel?.textColor = .white
        nextButton.backgroundColor = UIColor(named: "primary 900")
    }

}
