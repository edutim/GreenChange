//
//  ReceiveView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-01.
//

import SwiftUI

struct ReceiveView: View {
    @EnvironmentObject var vm: WalletViewModel
    var body: some View {
        VStack {
            Text("Have the sender scan this code to send you GC.")
            Divider()
            Image(uiImage: vm.generateQRCode())
                .resizable()
                .scaledToFit()
                .padding()
            Divider()
            Text("You'll receive an alert when the transfer is confirmed.")
        }
        .navigationTitle("Recieve GreenChange")
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
    }
}
