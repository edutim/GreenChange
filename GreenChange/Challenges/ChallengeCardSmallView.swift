//
//  ChallengeCardSmallView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-15.
//

import SwiftUI

struct ChallengeCardSmallView: View {
    
    var challenge: Challenge
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(challenge.image)
                .resizable()
                .cornerRadius(10)
            Text(challenge.title)
                .font(.caption)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding()
                    .shadow(color: .black, radius: 5)
        }
        .frame(maxHeight: 50)
        
    }
}

struct ChallengeCardSmallView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardSmallView(challenge: Challenge.example)
    }
}
