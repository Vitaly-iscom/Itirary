//
//  TripsTableViewCell.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 19/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.addShadowAndRoundedCorners()
        cardView.backgroundColor = Theme.accent
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }

    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            
            UIView.animate(withDuration: 1) { [unowned self] in
                self.tripImageView.alpha = 1
            }
        }
    }
}

