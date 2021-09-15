//
//  SendStep3View.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-08.
//

import SwiftUI

struct SendStep3View: View {
    @Binding var showingSubView: String
    @Binding var sendAmount: String
    @Binding var receiverAccountID: String
    
    @State var buttonActive = false
    @EnvironmentObject var vm: WalletViewModel
    
    var body: some View {
        VStack {
            Text("Confirm Transfer")
                .navigationTitle("Confirm")
            Text("Sending \(sendAmount) GreenChange to \(receiverAccountID)")
            Button("Transfer") {
                
            }
            .disabled(buttonActive)
        }
        .onAppear() {
            
            vm.validateTranfer(amount: Int(sendAmount)!,from: UUID(), to: UUID())
        }
    }
}

struct SendStep3View_Previews: PreviewProvider {
    static var previews: some View {
        SendStep3View(showingSubView: .constant(""), sendAmount: .constant(""), receiverAccountID: .constant(""))
    }
}
