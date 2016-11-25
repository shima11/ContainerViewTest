//
//  RoundView.swift
//  ContainerViewTest
//
//  Created by shima jinsei on 2016/11/25.
//  Copyright © 2016年 Jinsei Shima. All rights reserved.
//

import UIKit

class RoundView: UIView {

//    @IBInspectable var cornerRadious: CGFloat = 4.0
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height/2.0
        self.clipsToBounds = true
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
    }
    

}
