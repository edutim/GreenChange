//
//  Event.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-01.
//

import Foundation
import MapKit

struct Event: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var startTime: Date
    var endTime: Date
    var webLink: String
    var image: String
    var coordinate: CLLocationCoordinate2D?
    var isAttending = false
    
    static var example = Event(id: UUID(), title: "Event !", description: "", startTime: Date(), endTime: Date(), webLink: "", image: "", coordinate: nil)
}
