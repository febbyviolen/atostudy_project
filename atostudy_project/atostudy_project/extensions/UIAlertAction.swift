//
//  UIAlertAction.swift
//  atostudy_project
//
//  Created by Ebbyy on 10/29/23.
//

import Foundation
import UIKit

extension UIAlertAction {
    public var isEnabled: Bool {
        get { return value(forKey: "enabled") as! Bool }
        set { setValue(newValue, forKey: "enabled") }
    }
    
    public var isChecked: Bool {
        get { return value(forKey: "checked") as! Bool }
        set { setValue(newValue, forKey: "checked") }
    }
    
    public var image: UIImage? {
        get { return value(forKey: "image") as? UIImage }
        set { setValue(newValue, forKey: "image") }
    }
    
    public var titleTextColor: UIColor? {
        get { return value(forKey: "titleTextColor") as? UIColor }
        set { setValue(newValue, forKey: "titleTextColor") }
    }
    
    public var imageTintColor: UIColor? {
        get { return value(forKey: "imageTintColor") as? UIColor }
        set { setValue(newValue, forKey: "imageTintColor") }
    }
    
    public var descriptiveText: String? {
        get { return value(forKey: "_descriptiveText") as? String }
        set { setValue(newValue, forKey: "_descriptiveText") }
    }
    
    @available(iOS 9.0, *)
    public var keyCommandInput: String? {
        get { return value(forKey: "keyCommandInput") as? String }
        set { setValue(newValue, forKey: "keyCommandInput") }
    }
    
    @available(iOS 9.0, *)
    public var keyCommandModifierFlags: UIKeyModifierFlags {
        get { return value(forKey: "keyCommandModifierFlags") as! UIKeyModifierFlags }
        set { setValue(newValue, forKey: "keyCommandModifierFlags") }
    }
}
