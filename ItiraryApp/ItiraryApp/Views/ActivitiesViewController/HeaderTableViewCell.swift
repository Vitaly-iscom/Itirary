//
//  HeaderTableViewCell.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 26/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 18)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 16)
        titleLabel.dropshadow()
        subtitleLabel.dropshadow()
        
    }

    func setap(model: DayModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }

}
