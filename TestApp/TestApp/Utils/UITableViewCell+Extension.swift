//
//  UITableViewCell+Extension.swift
//  TestApp
//
//  Created by Shreya Bhatia on 30/03/20.
//  Copyright © 2020 Shreya Bhatia. All rights reserved.
//

import UIKit

//MARK:- Extension for setting border of UITableViewCell
extension UITableViewCell {
    
    func didSetBorder() {
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowRadius = 4
        self.contentView.layer.shadowOpacity = 0.25
        self.contentView.layer.masksToBounds = false
        self.contentView.clipsToBounds = false
    }
}
