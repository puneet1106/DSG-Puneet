//
//  UITableViewCell+Extension.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import UIKit


extension UITableViewCell {
    
    static var nib  : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }

    
}
