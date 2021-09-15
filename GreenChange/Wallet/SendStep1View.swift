//
//  SendStep1View.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-08.
//

import SwiftUI

struct SendStep1View: View {
    @EnvironmentObject var vm: WalletViewModel
    
    @Binding var sendAmount: String
    @Binding var showingSubView: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("Enter Amount", text: $sendAmount)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .padding()
                        
                    Divider()
                    ZStack {
                        Circle()
                            .frame(width: 45)
                        Text("MAX")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        sendAmount = String(vm.activeAccount.totalCoin)
                    }
                }
                
            }
            HStack {
                Image("coin")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Text("My Wallet")
                Spacer()
                Text(String(vm.activeAccount.wallet))
                    .padding()
            }
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 4)
                )
            .padding()
            Button("Continue", action: {
                withAnimation() {
                    showingSubView = "step2"
                }
            })
            Spacer()
            Spacer()
        }

    }
}

struct SendStep1View_Previews: PreviewProvider {
    static var previews: some View {
        SendStep1View(sendAmount: .constant(""), showingSubView: .constant(""))
    }
}
