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
    
    //test용 = kakao default 값
    var recentLogin = UserDefaults.standard.string(forKey: "recentLogin") ?? "KAKAO"
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNicknameController" {
            if let VC = segue.destination as? NicknameController {
                VC.snsLogin = recentLogin
            }
        }
    }
    
    @IBAction func appleLoginTapped(_ sender: Any) {
        recentLogin = "APPLE"
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func kakaoLoginTapped(_ sender: Any) {
        recentLogin = "KAKAO"
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func naverLoginTapped(_ sender: Any) {
        recentLogin = "NAVER"
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    @IBAction func googleLoginTapped(_ sender: Any) {
        recentLogin = "GOOGLE"
        self.performSegue(withIdentifier: "showNicknameController", sender: self)
    }
    
    private func setupUI(){
        
        //가입한 기록이 있는 경우
        switch recentLogin {
        case "KAKAO" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = false
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        case "APPLE" :
            recentAppleLoginBubble?.isHidden = false
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        case "NAVER" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = false
            recentGoogleLoginBubble?.isHidden = true
        case "GOOGLE" :
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = false
        default:
            recentAppleLoginBubble?.isHidden = true
            recentKakaoLoginBubble?.isHidden = true
            recentNaverLoginBubble?.isHidden = true
            recentGoogleLoginBubble?.isHidden = true
        }
        
    }


}

