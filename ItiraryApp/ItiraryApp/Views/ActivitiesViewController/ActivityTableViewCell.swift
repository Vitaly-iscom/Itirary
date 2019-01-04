//
//  ActivityTableViewCell.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 26/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)
    }

    func setup(model: ActivityModel) {
        activityImageView.image = getActivityImageView(type: model.activityType)
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        
    }

    func getActivityImageView(type: ActivityType) -> UIImage? {

        switch type {
        case .auto:
            return #imageLiteral(resourceName: "Car")
        case .excursion:
            return #imageLiteral(resourceName: "Excursion")
        case .flight:
            return #imageLiteral(resourceName: "Flight")
        case .food:
            return #imageLiteral(resourceName: "Food")
        case .hotel:
            return #imageLiteral(resourceName: "Hotel")
        }
    }
}
