//
//  SendStep2View.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-08.
//

import SwiftUI

struct SendStep2View: View {
    @Binding var showingSubView: String
    @Binding var receiverAccountID: String
    
    var body: some View {
        VStack {
            Text("Scan the recievers code.")
            CodeScannerView(codeTypes: [.qr], completion: { result in
                switch result {
                case .success(let qrContent):
                    receiverAccountID = qrContent
                    withAnimation() {
                        showingSubView = "step3"
                    }
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
}

struct SendStep2View_Previews: PreviewProvider {
    static var previews: some View {
        SendStep2View(showingSubView: .constant(""), receiverAccountID: .constant(""))
    }
}
