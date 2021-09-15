//
//  NewAccountView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-09.
//

import SwiftUI

struct NewAccountView: View {
    @EnvironmentObject var vm: WalletViewModel
    
    @State var potentialUsername: String = ""
    @State var showProgressView = false
    @State var confirmButtonActive = false
    @Binding var showView: Bool
    
    @State var rotateAmount = 0.0
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Group {
                    Text("GreenChange")
                        .font(.title)
                        .foregroundColor(.white)
                    Image("Coin1")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .padding()
                        .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
                        .animation(.easeInOut)
                        .onTapGesture {
                            withAnimation {
                                self.rotateAmount += 360
                            }
                        }
                    Text("Challenge Based Earning")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Text("Make Change in Your City with GreenChange")
                        .foregroundColor(Color.white)
                    Divider()
                        .frame(height: 2.0)
                        .background(Color.white)
                        .padding()
                }
                Text("Please enter a username.")
                    .foregroundColor(.white)
                TextField("", text: $potentialUsername)
                    .placeholder(when: potentialUsername.isEmpty, placeholder: {
                        
                        HStack(alignment: .center) {
                           Spacer()
                            Text("Username")
                                .opacity(0.6)
                            Spacer()
                        }
                            
                    })
                    .multilineTextAlignment(.center)
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .border(Color.white, width: 2)
                    .font(.title)
                    .cornerRadius(5)
                    .padding()
                Button("Create Account") {
                    showProgressView = true
                    vm.createAccount(name: potentialUsername)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.darkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                if showProgressView {
                    ProgressView("Validating")
                }
                Spacer()
                ScrollingFacts (text: "Did you know? One ton of recycled cardboard saves 46 gallons of oil")
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .onChange(of: vm.newAccountCreated, perform: { wasCreated in
                showProgressView = false
                showView = false
            })
        }
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView(showView: .constant(true))
            .environmentObject(WalletViewModel())
    }
}
