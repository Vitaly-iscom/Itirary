//
//  UIButtonExtension.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 19/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

extension UIButton {

    func createFloatingActionButton() {
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        tintColor = Theme.accent
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }

}
