//
//  ScrollingFactsView.swift
//  Onboarding GreenChange
//
//  Created by MayGem on 9/8/21.
//

import SwiftUI

struct ScrollingFacts: View {
    let text: String
    @State private var moveView = false
    @State private var stopAnimation = false
    @State private var textFrame: CGRect = CGRect()
    public init(text: String) {
        self.text = text
    }
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false, content: {
                Text(text)
                    .lineLimit(1)
                    .background(GeometryGetter(rect: $textFrame)).offset(moveView ? CGSize(width: -1 * textFrame.width, height: 0) : CGSize(width: proxy.size.width, height: 0))
                .onAppear() {
                    self.stopAnimation = false
                    animateView()
                    moveViewOnAnimationEnd()///scrollViewProxy.scrollTo("Identifier") /// does not animate
                }.onDisappear() {
                    self.stopAnimation = true
                }
            })
        }
    }
    private func animateView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: { //after 0.5 sec
            withAnimation(Animation.linear(duration: Double(textFrame.width) * 0.05)) {
                moveView = true
            }//no on completion so need to add another time bound method to restart animation from start
        })
    }
    private func moveViewOnAnimationEnd() {
        let timeToAnimate = (Double(textFrame.width) * 0.01) + 0.2
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeToAnimate, execute: { //after 2 sec
            moveView = false
            if stopAnimation == false {
                animateView()
                moveViewOnAnimationEnd()
            }
        })
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { (proxy) -> Path in
            DispatchQueue.main.async {
                self.rect = proxy.frame(in: .global)
            }
            return Path()
        }
    }
}

struct Marque_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrollingFacts(text: "Did you know? One ton of recycled cardboard saves 46 gallons of oil")
            .foregroundColor(.blue)
    }
}

