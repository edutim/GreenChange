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
            let e1 = Event(id: UUID(), title: "Detroit River Shoreline Clean Up", description: "Plastic Oceans International is hosting a litter cleanup along the Detroit River in celebration of International Coastal Cleanup Day. We’ll be picking up trash and debris at Detroit's Maheras-Gentry Park for two hours. We'll collect the litter and weigh it to quantify our impact. Joining us for the cleanup will be our friends from Green Living Science and The Social Forestry Project.", date: "9/19/21", startTime: Date(), endTime: Date(), webLink: "http://apple.com", image: "Sept18RiverClean", address: "Maheras-Gentry Park 12550 Avondale St Detroit,MI 48215" ,coordinate: .init(latitude: 42.327252, longitude:  -83.048675), potentialPoints: "300", webAddress: "https://www.apple.com")
            events.append(e1)
            
            let e2 = Event(id: UUID(), title: "Explore Your City Ride: Trees of Windsor", description: "Back by popular request! On this tour former City of Windsor Forester Bill Roesel will speak to us about some of the City's forests, unique ecosystems, and distinctive trees, and he'll discuss the importance of trees to our environment and to our lives. We will also do some tree identification and questions are encouraged. \n Suggested donation of $20, or pay what you can.", date: "", startTime: Date(), endTime: Date(), webLink: "http://apple.com", image: "windsorbikeride", address: "", coordinate: .init(latitude: 42.327252, longitude:  -83.048675), potentialPoints: "0", webAddress: "")
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
