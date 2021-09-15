//
//  MapViewModel.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import Foundation
import MapKit
import SwiftUI

enum AnnotationType {
    case event
    case challenge
    case business
}

struct AnnotationItem: Identifiable {
    let id: UUID
    var name: String
    var image: String
    var annotationType: AnnotationType
    var coordinate: CLLocationCoordinate2D
    var show = false
    
}

class MapViewModel: ObservableObject {
    @Published var mapItems = [AnnotationItem]()
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.329390, longitude: -83.044933), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @Published var trackingMode = MapUserTrackingMode.follow
    
    init() {
        
    }
    
    func createMapItems() {
        let filteredChallenges = ChallengesViewModel.shared.challenges.filter({$0.coordinate != nil})
        let filteredEvents = EventsViewModel.shared.events.filter({$0.coordinate != nil})
        for item in filteredChallenges {
            let newAnnotationItem = AnnotationItem(id: item.id, name: item.title, image: item.image, annotationType: .challenge, coordinate: item.coordinate!)
            mapItems.append(newAnnotationItem)
        }
        for item in filteredEvents {
            let newAnnotationItem = AnnotationItem(id: item.id, name: item.title, image: item.image, annotationType: .event, coordinate: item.coordinate!)
            mapItems.append(newAnnotationItem)
        }
    }
    
}
