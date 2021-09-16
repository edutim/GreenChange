//
//  EventCardSmallView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-15.
//

import SwiftUI

struct EventCardSmallView: View {
    
    var event: Event
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(event.image)
                .resizable()
                .cornerRadius(10)
            Text(event.title)
                .font(.caption)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding()
                .shadow(color: .black, radius: 5)
        }
        .frame(maxHeight: 50)
        
    }
}

struct EventCardSmallView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardSmallView(event: Event.example)
    }
}
