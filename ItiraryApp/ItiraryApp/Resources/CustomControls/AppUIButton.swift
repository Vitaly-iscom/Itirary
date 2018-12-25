//
//  AppUIButton.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 20/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
