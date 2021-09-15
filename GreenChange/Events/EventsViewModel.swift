//
//  EventsViewModel.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import Foundation

class EventsViewModel: ObservableObject {
    
    static var shared = EventsViewModel()
    
    var events = [Event]() {
        willSet {
            saveEvents()
            objectWillChange.send()
        }
    }
    
    init() {
        if let eventsData = UserDefaults.standard.data(forKey: "events") {
            if let decoded = try? JSONDecoder().decode([Event].self, from: eventsData) {
                self.events = decoded
                return
            }
        } else {
            print("Loading Default data")
            let e1 = Event(id: UUID(), title: "Detroit River Shoreline Clean Up", description: "This is a description. This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.", startTime: Date(), endTime: Date(), webLink: "http://apple.com", image: "Sept18RiverClean", coordinate: .init(latitude: 42.327252, longitude:  -83.048675))
            events.append(e1)
            
            let e2 = Event(id: UUID(), title: "Explore Your City Ride: Trees of Windsor", description: "This is a description. This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.", startTime: Date(), endTime: Date(), webLink: "http://apple.com", image: "windsorbikeride", coordinate: .init(latitude: 42.327252, longitude:  -83.048675))
            events.append(e2)
            
            
            saveEvents()
        }
    }
    
    func saveEvents() {
        do {
            let eventsData = try JSONEncoder().encode(events)
            UserDefaults.standard.set(eventsData, forKey: "events")
        } catch {
            print(error)
        }
        
    }
    
}
