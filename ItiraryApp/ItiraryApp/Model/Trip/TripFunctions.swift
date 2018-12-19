//
//  TripFunctions.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 18/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(complection: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripsModels.count == 0 {
                Data.tripsModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripsModels.append(TripModel(title: "Mexico"))
                Data.tripsModels.append(TripModel(title: "Russian trip"))
            }
            DispatchQueue.main.async {
                complection()
            }
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}
