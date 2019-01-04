//
//  ActivityModel.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 25/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}
