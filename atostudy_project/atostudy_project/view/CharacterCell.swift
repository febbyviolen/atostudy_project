//
//  CharacterCell.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/28/23.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {

    @IBOutlet var container: UIView?
    @IBOutlet var background: UIView?
    @IBOutlet var characterBackground: UIView?
    @IBOutlet var nameBackground: UIView?
    @IBOutlet var stackView: UIStackView?
    @IBOutlet var img: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    private func setupUI() {
        background?.layer.cornerRadius = 16
        background?.layer.shadowColor = UIColor.black.cgColor
        background?.layer.shadowOpacity = 0.1
        background?.layer.shadowRadius = 5
        background?.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        characterBackground?.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        nameBackground?.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 16)
        
    }
    
    func config(imgURL: String, korName: String) {
        let url = URL(string: imgURL)
        img?.kf.setImage(with: url)
        nameLabel?.text = korName
        
        switch korName {
        case "노노" :
            characterBackground?.backgroundColor = UIColor(named: "yellow_NONO")
        case "고고" :
            characterBackground?.backgroundColor = UIColor(named: "purple_GOGO")
        case "두두" :
            characterBackground?.backgroundColor = UIColor(named: "blue_DODO")
        default :
            characterBackground?.backgroundColor = UIColor(named: "yellow_NONO")
        }
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
