//
//  ChallengeActiveView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-15.
//

import SwiftUI

struct ChallengeActiveView: View {
    
    var challenge: Challenge
    
    var body: some View {
        if challenge.title == "Compost It" {
            CompostIt()
        }
    }
}

struct ChallengeActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeActiveView(challenge: Challenge.example)
    }
}
