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
            Image(uiImage: vm.generateQRCode())
                .resizable()
                .scaledToFit()
                .padding()
            Text("Have the sender scan this code to send you GC.")
        }
        .navigationTitle("Recieve GreenChange")
    }
}

struct ReceiveView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveView()
    }
}
