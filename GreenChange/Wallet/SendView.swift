//
//  SendView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-01.
//

import SwiftUI

struct SendView: View {
    
    @State var sendAmount = ""
    @State var receiverAccountID = ""
    @State private var showingSubView = "step1"
    
    var body: some View {
        if showingSubView == "step1" {
            SendStep1View(sendAmount: $sendAmount, showingSubView: $showingSubView)
                .transition(.scale)
        } else if showingSubView == "step2"{
            SendStep2View(showingSubView: $showingSubView, receiverAccountID: $receiverAccountID)
                .transition(.scale)
        } else if showingSubView == "step3" {
            SendStep3View(showingSubView: $showingSubView, sendAmount: $sendAmount, receiverAccountID: $receiverAccountID)
                .transition(.scale)
        }
        
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
