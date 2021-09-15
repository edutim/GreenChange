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
            let c1 = Challenge(id: UUID(), title: "Litter Walk", description: "This is a description. This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.", image: "litterwalk", coordinate: nil)
            challenges.append(c1)
            
            let c2 = Challenge(id: UUID(), title: "Compost It", description: "Food scraps placed in the garbage and carried to the landfill decompose and produce methane gas, a greenhouse gas which is far more potent that carbon dioxide. \n\n Composting is a process that works to speed up the natural decay of organic material by providing the ideal conditions for detritus-eating organisms to thrive. The end-product of this concentrated decomposition process is nutrient-rich soil that can help crops, garden plants and trees to grow.", image: "compost", coordinate: nil)
            challenges.append(c2)
            
            let c3 = Challenge(id: UUID(), title: "Bike > Drive", description: "This is a description. This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.This is a description.", image: "bikechallenge", coordinate: nil)
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
