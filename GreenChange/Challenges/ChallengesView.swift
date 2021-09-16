//
//  ChallengesView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

struct ChallengesView: View {
    @EnvironmentObject var challengesVM: ChallengesViewModel
    
    @State private var selectedFilter = 0
    
    var body: some View {
        NavigationView() {
            
            VStack(spacing: 10) {
                Picker("Hey", selection: $selectedFilter, content: {
                    Text("All").tag(0)
                    Text("Active").tag(1)
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                if selectedFilter == 0 {
                    List(challengesVM.challenges) { challenge in
                        NavigationLink(destination: ChallengeDetailView(challenge: challenge), label: {
                            ChallengeCardView(challenge: challenge)
                        })
                        
                    }
                    .listStyle(PlainListStyle())
                }
                if selectedFilter == 1 {
                    List(challengesVM.challenges.filter {$0.isActive}) { challenge in
                        NavigationLink(destination: ChallengeActiveView(challenge: challenge), label: {
                            ZStack{
                                ChallengeCardView(challenge: challenge)
                            }
                        })
                        
                    }
                    .listStyle(PlainListStyle())
                }
                
            }
            .navigationTitle("Challenges")
            
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
