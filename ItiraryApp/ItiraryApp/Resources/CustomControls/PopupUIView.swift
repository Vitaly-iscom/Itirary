//
//  PopupUIView.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 20/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.backgroundColor
    }

}
