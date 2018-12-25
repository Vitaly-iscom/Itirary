//
//  FloatingButton.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 19/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        tintColor = Theme.backgroundColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    

}
