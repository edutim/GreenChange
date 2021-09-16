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
    var date: String
    var startTime: Date
    var endTime: Date
    var webLink: String
    var image: String
    var address: String
    var coordinate: CLLocationCoordinate2D?
    var potentialPoints: String
    var webAddress: String
    var isAttending = false
    
    static var example = Event(id: UUID(), title: "Event !", description: "", date: "", startTime: Date(), endTime: Date(), webLink: "", image: "", address: "", coordinate: nil, potentialPoints: "0", webAddress: "https://www.apple.com")
}
