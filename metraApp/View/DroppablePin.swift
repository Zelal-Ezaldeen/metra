//
//  DroppablePin.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/14/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit
import MapKit

class DroppablePin: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
}
