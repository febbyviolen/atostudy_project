//
//  ViewController.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appleLoginButton: UIButton?
    @IBOutlet weak var kakaoLoginButton: UIButton?
    @IBOutlet weak var naverLoginButton: UIButton?
    @IBOutlet weak var googleLoginButton: UIButton?
    
    @IBOutlet weak var recentAppleLoginBubble: UIView?
    @IBOutlet weak var recentKakaoLoginBubble: UIView?
    @IBOutlet weak var recentNaverLoginBubble: UIView?
    @IBOutlet weak var recentGoogleLoginBubble: UIView?
    
    var recentLogin = "kakao"
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    @IBAction func appleLoginTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func kakaoLoginTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func naverLoginTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func googleLoginTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    private func setupUI(){
        
        //가입한 기록이 있는 경우
        switch recentLogin {
        case "kakao" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = false
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        case "apple" :
            recentAppleLoginBubble?.isHidden = false
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        case "naver" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = false
            recentGoogleLoginBubble?.isHidden = true
        case "google" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = false
        default:
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = false
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        }
        
    }


}

