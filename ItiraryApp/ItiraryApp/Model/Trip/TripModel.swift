//
//  TripModel.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 18/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class TripModel {
    var id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
