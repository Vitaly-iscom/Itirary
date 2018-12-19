//
//  TripModel.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 18/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import Foundation

class TripModel {
    var id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
