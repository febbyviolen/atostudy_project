//
//  SelectCharacterController.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/28/23.
//

import UIKit

class SelectCharacterController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView?
    @IBOutlet var nextButton: UIButton?
    
    let reuseId = "characterCell"
    var characterArray = [characterData]()
    
    var snsLogin = ""
    var nickName = ""
    var selectedCharacter = 1
    
    private enum Const {
        static let itemSize = CGSize(width: 204, height: 301)
        static let itemSpacing = 10.0
        
        static var insetX: CGFloat {
            (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        
        static var collectionViewContentInset: UIEdgeInsets {
            UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
        }
    }
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Const.itemSize
        layout.minimumLineSpacing = Const.itemSpacing 
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        setupCollectionView()
        getData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSignUpController" {
            if let vc = segue.destination as? SignUpController {
                vc.SNS = snsLogin
                vc.nickName = nickName
                vc.character = selectedCharacter
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        //        API.shared
        //            .signUp(snsType: snsLogin, nickName: nickName, character: selectedCharacter) { res in
        //                if res.data != nil {
        
        UserDefaults.standard.setValue(snsLogin, forKey: "recentLogin")
        
        //        snsLogin = res.data?.snsType
//        nickName = res.data?.nickName
//        selectedCharacter = res.data?.character
        self.performSegue(withIdentifier: "showSignUpController", sender: self)
        
        
        //                } else if res.error != nil {
        //                    let attributedString = NSAttributedString(string: res.error?.message ?? "", attributes: [
        //                        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), //your font here
        //                        NSAttributedString.Key.foregroundColor : UIColor(named: "primary 900")!
        //
        //                    ])
        //
        //                    let alert = UIAlertController(title: res.error?.message, message: "", preferredStyle: .alert)
        //                    alert.setValue(attributedString, forKey: "attributedTitle")
        //
        //                    let okAction = UIAlertAction(title: "네", style: .default, handler: nil)
        //                    okAction.titleTextColor = UIColor(named: "black 900")
        //
        //                    alert.addAction(okAction)
        //                    self.present(alert, animated: true)
        //
        //                }
        //        }
    }
    
    private func getData(){
//        API.shared.getCharacter { res in
//            characterData = res
//            collectionView?.reloadData()
//        }
    }
    
    private func setupCollectionView() {
        
        collectionView?.collectionViewLayout = collectionViewFlowLayout
        collectionView?.isScrollEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = true
        collectionView?.clipsToBounds = true
        collectionView?.isPagingEnabled = false
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.decelerationRate = .fast
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UINib(nibName: "CharacterCell", bundle: nil), forCellWithReuseIdentifier:
                                    "characterCell")
    }
    
    private func setupUI() {
        nextButton?.layer.cornerRadius = 16
        nextButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
}

extension SelectCharacterController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //test data
        return testCharacterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCell
        
        if indexPath.row != 0 {
            cell.container?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } else if indexPath.row == 0 {
            cell.background?.layer.borderColor = UIColor(named: "primary 900")?.cgColor
            cell.background?.layer.borderWidth = 2
        }
        
        //test data
        let data = testCharacterData //characterArray
        cell.config(imgURL: data[indexPath.row].filePath, engName: data[indexPath.row].engName)
        return cell
    }
}

extension SelectCharacterController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 95, bottom: 0, right: 95)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        checkOffsetValue(scrollView: scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
    
    func checkOffsetValue(scrollView: UIScrollView) {
        let xOffset = scrollView.contentOffset.x + Const.itemSpacing
        let curIndex = Int(xOffset/Const.itemSize.width)
        let nextIndex = curIndex + 1
        let lastIndex = curIndex - 1
        let offsetInCurrentContext = xOffset - CGFloat(curIndex) * Const.itemSize.width
        
        let value = (((offsetInCurrentContext / Const.itemSize.width) * 100 ) * 0.2 ) / 100

        let currentCell = collectionView?.cellForItem(at: IndexPath(row: curIndex, section: 0)) as? CharacterCell
        let nextCell = collectionView?.cellForItem(at: IndexPath(row: nextIndex, section: 0)) as? CharacterCell
        let lastCell = collectionView?.cellForItem(at: IndexPath(row: lastIndex, section: 0)) as? CharacterCell
        
        currentCell?.container?.transform = CGAffineTransform(scaleX: 1 - value, y: 1 - value)
        currentCell?.background?.layer.borderColor = UIColor(named: "primary 900")?.cgColor
        currentCell?.background?.layer.borderWidth = 2
        selectedCharacter = curIndex + 1
        
        nextCell?.container?.transform = CGAffineTransform(scaleX: 0.7 + value, y: 0.7 + value)
        nextCell?.background?.layer.borderWidth = 0
        lastCell?.background?.layer.borderWidth = 0
    }
}

