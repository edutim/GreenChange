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
    
    let internalGradient = LinearGradient(gradient: Gradient(colors: [Color.darkGreen, Color.lightGreen]), startPoint: .bottomTrailing, endPoint: .topLeading)
    
    @Environment(\.presentationMode) var presentation

    
    var body: some View {
        VStack {
           
            Text("Sending")
                .navigationTitle("Confirm Transfer")
            ZStack {
                Circle()
                    .fill(internalGradient)
                    .frame(width: 250, height: 250)
                    .padding()
                VStack {
                    Spacer()
                    Text(sendAmount)
                        .font(.system(size: 128))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .aspectRatio(contentMode: .fit)
            Image(systemName: "arrow.down.circle.fill")
                .foregroundColor(.accentColor)
            Text("\(receiverAccountID)")
            
            HStack(alignment: .center) {
                Spacer()
                Button("Confirm") {
                    vm.validateTranfer(amount: Int(sendAmount)!,from: vm.activeAccount.id, to: UUID(uuidString: "\(receiverAccountID)")!)
                    self.presentation.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.accentColor)
                .clipShape(Capsule())
                Spacer()

            }
            
        }
        .onAppear() {
            
            
        }
    }
}

//struct SendStep3View_Previews: PreviewProvider {
//    static var previews: some View {
//        SendStep3View(showingSubView: .constant(""), sendAmount: .constant(""), receiverAccountID: .constant(""), isShowingSendView: .constant(.true))
//    }
//}
