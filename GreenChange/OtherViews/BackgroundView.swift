//
//  BackgroundView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-13.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.darkGreen, Color.lightGreen]), startPoint: .bottomTrailing, endPoint: .topLeading)
//            .edgesIgnoringSafeArea(.all)
        Color.darkGreen
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
