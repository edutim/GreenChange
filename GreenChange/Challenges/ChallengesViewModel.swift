//
//  ChallengesViewModel.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import Foundation

class ChallengesViewModel: ObservableObject {
    
    static var shared = ChallengesViewModel()
    
    var challenges = [Challenge]() {
        willSet {
            saveChallenges()
            objectWillChange.send()
        }
    }
    
    init() {
        if let challengesData = UserDefaults.standard.data(forKey: "challenges") {
            if let decoded = try? JSONDecoder().decode([Challenge].self, from: challengesData) {
                self.challenges = decoded
                return
            }
        } else {
            print("Loading Default data")
            let c1 = Challenge(id: UUID(), title: "Litter Walk", description: "This challenge helps people understand how litter is impacting our world. It also shows how we can do our part in making the world a cleaner space one day at a time.\n\n By committing to this challenge you promise to get outside for at least 20 minutes a day, pick up at least 20 pieces of trash and do the challenge for at least 20 days.", image: "litterwalk", coordinate: nil)
            challenges.append(c1)
            
            let c2 = Challenge(id: UUID(), title: "Compost It", description: "Almost 20 percent of methane emissions in the United States come from organics unable to completely break down in landfill. Methane is 30x more powerful than your average Co2.\n\n Over the next 20 days, your challenge is to start composting. If you live in an apartment, consider freezing your food scraps and donating them to your local farmers market or community garden.\n\n If you have a backyard or a balcony, invest in a tumbler or enclosed bin to put your food scraps into. Use an app (Share Waste) or service (MotorCity Compost) to assist with your goal!", image: "compost", coordinate: nil)
            challenges.append(c2)
            
            let c3 = Challenge(id: UUID(), title: "Bike > Drive", description: "In the United States, nearly 50 percent of trips taken by car are less than three miles long and 35 percent are less than two miles long. These are short trips that if taken by bike instead of by car could be both convenient and contribute to big changes for the planet and the participant.\n\n All rides under 3 miles and other bike rides marked as 'transportation' rides will count towards the goal of 'Drive Less, Bike More.' Log how far your biked each day for one week.", image: "bikechallenge", coordinate: nil)
            challenges.append(c3)
            saveChallenges()
        }
    
    }
    
    func saveChallenges() {
        do {
            let challengesData = try JSONEncoder().encode(challenges)
            UserDefaults.standard.set(challengesData, forKey: "challenges")
        } catch {
            print(error)
        }
        
    }
    
    
    
    
}
