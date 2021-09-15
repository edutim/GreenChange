//
//  ChallengeDetailView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import SwiftUI

struct ChallengeDetailView: View {
    @EnvironmentObject var challengesVM: ChallengesViewModel
    
    
    
    var challenge: Challenge
    var body: some View {
        ScrollView {
            VStack {
                Image(challenge.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                HStack {
                    Text(challenge.title)
                        .font(.title)
                    Spacer()
                }
                .padding()
                Button(action: {
                    if let index = challengesVM.challenges.firstIndex(where: {$0.id == challenge.id}) {
                        challengesVM.challenges[index].isActive = true
                        challengesVM.saveChallenges()
                    }
                }, label: {
                    Text("Join Challenge")
                })
                Text(challenge.description)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                
            }
            
        }
    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(challenge: Challenge.example)
    }
}
