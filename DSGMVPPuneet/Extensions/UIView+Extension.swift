//
//  UIView+Extension.swift
//  DSGMVPPuneet
//
//  Created by Puneet on 24/09/21.
//

import UIKit

extension UIView {
    
    func setShadowView(){
        
        self.layer.cornerRadius = 8.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0 ,height:0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
        
    }
    
    
    
}
