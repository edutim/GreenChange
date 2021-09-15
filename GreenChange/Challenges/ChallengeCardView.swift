//
//  ActivityAndEventsCardView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-01.
//

import SwiftUI

struct ChallengeCardView: View {
    
    var challenge: Challenge
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(challenge.image)
                .resizable()
                .cornerRadius(20)
            Text(challenge.title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding()
                    .shadow(color: .black, radius: 5)
        }
        .frame(maxHeight: 100)
        .padding()
    }
}

struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        ChallengeCardView(challenge: Challenge.example)
    }
}
