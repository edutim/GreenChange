//
//  ContentView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: WalletViewModel
    
    @State private var showNewAccountView = false
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView {
            WalletView(showNewAccountView: $showNewAccountView)
                .tabItem {
                    Label("You", systemImage: "person.fill")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            ChallengesView()
                .tabItem {
                    Label("Challenges", systemImage: "flag.fill")
                }
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
        }
        .sheet(isPresented: $showNewAccountView, content: {
            NewAccountView(showView: $showNewAccountView)
        })
        .onReceive(timer) { timer in
            vm.getWalletTotal()
        }
        
        .onAppear() {
            vm.getAccount()
            if vm.showNewAccount {
                showNewAccountView = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WalletViewModel())
    }
}

