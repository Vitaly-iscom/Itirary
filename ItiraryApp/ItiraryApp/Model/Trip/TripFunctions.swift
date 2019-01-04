//
//  TripFunctions.swift
//  ItiraryApp
//
//  Created by Виталий Исхаков on 18/12/2018.
//  Copyright © 2018 IScom. All rights reserved.
//

import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripsModels.append(tripModel)
    }
    
    static func readTrips(complection: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripsModels.count == 0 {
                Data.tripsModels = MockData.createMockTripModelData()
            }
            DispatchQueue.main.async {
                complection()
            }
        }
    }
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
        // replace with real data store code
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripsModels.first(where: {$0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        
        Data.tripsModels[index].title = title
        Data.tripsModels[index].image = image
    }
    
    static func deleteTrip(index: Int) {
        Data.tripsModels.remove(at: index)
    }
}
