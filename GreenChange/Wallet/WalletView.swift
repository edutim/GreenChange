//
//  WalletView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

struct WalletView: View {
    @EnvironmentObject var vm: WalletViewModel
    
    @State private var showNotifications = false
    @State private var showSettings = false
    
    @State var rotateAmount = 0.0
    
    @Binding var showNewAccountView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    WalletAmountView()
                        .rotation3DEffect(
                            .degrees(rotateAmount),
                            axis: (x:0,y:1,z:0)
                        )
                        .animation(.easeInOut)
                        .onTapGesture {
                            withAnimation {
                                self.rotateAmount += 360
                            }
                        }
                    
                    Divider()
                    
                    HStack(alignment: .center) {
                        Spacer()
                        NavigationLink(
                            destination: ReceiveView(),
                            label: {
                                Text("Receive")
                            })
                        Spacer()
                        NavigationLink(
                            destination: SendView(),
                            label: {
                                Text("Send")
                            })
                        Spacer()
                    }
                    .frame(height: 40)
                    Divider()
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        VStack() {
                            VStack() {
                                Text("Active Challenges")
                                    .font(.subheadline)
                                    .bold()
                            }
                            List(ChallengesViewModel.shared.challenges.filter {$0.isActive}) { challenge in
                                NavigationLink(destination: ChallengeActiveView(challenge: challenge), label: {
                                    ZStack{
                                        ChallengeCardSmallView(challenge: challenge)
                                    }
                                })
                                
                            }
                            .listStyle(PlainListStyle())
                            //                            ScrollView() {
                            //                                VStack(spacing: 10) {
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                }
                            //                                .padding()
                            //                            }
                        }
                        VStack() {
                            VStack() {
                                Text("Active Events")
                                    .font(.subheadline)
                                    .bold()
                            }
                            List(EventsViewModel.shared.events.filter {$0.isAttending}) { event in
                                NavigationLink(destination: EventDetailView(event: event), label: {
                                    EventCardSmallView(event: event)
                                })
                            }
                            .listStyle(PlainListStyle())
                            //                            ScrollView() {
                            //                                VStack(spacing: 20) {
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                    ChallengeCardView(challenge: Challenge.example)
                            //                                }
                            //                                .padding()
                            //                            }
                        }
                    }
                    
                    Spacer()
                    Spacer()
                }
                .padding()
                .navigationTitle("You")
                .sheet(isPresented: $showNotifications) {
                    NotificationView()
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            showNotifications.toggle()
                        }, label: {
                            Image(systemName: "bell.fill")
                        })
                        Button(action: {
                            showSettings.toggle()
                        }, label: {
                            Image(systemName: "gearshape.fill")
                        })
                    }
                }
                .onAppear() {
                    vm.getAccount()
                    vm.getWalletTotal()
                    
                }
                
                
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(showNewAccountView: .constant(true))
            .environmentObject(WalletViewModel())
    }
}
