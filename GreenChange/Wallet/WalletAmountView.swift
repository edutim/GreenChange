//
//  WalletAmountView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

struct WalletAmountView: View {
    @EnvironmentObject var vm: WalletViewModel
    
    let internalGradient = LinearGradient(gradient: Gradient(colors: [Color.darkGreen, Color.lightGreen]), startPoint: .bottomTrailing, endPoint: .topLeading)
    
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(internalGradient)
                .frame(width: 250, height: 250)
                .padding()
            VStack {
                Spacer()
                Text("\(vm.activeAccount.wallet)")
                    .font(.system(size: 128))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Spacer()
            }
        }
        .aspectRatio(contentMode: .fit)
        .onChange(of: vm.accountUpdated, perform: { wasCreated in
            //vm.accountUpdated.toggle()
        })
    }
}

struct WalletAmountView_Previews: PreviewProvider {
    static var previews: some View {
        WalletAmountView()
    }
}
