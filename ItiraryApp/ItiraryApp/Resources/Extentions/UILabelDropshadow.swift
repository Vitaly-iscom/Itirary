//
//  UILabelDropshadow.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 26/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

extension UILabel {

    func dropshadow() {
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }

}
