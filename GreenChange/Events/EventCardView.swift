//
//  EventCardView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-14.
//

import SwiftUI

struct EventCardView: View {
    var event: Event
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(event.image)
                .resizable()
                .cornerRadius(20)
            Text(event.title)
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding()
                    .shadow(color: .black, radius: 5)
        }
        .frame(maxHeight: 100)
        .padding()
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event.example)
    }
}
