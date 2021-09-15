//
//  EventDetailView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var eventsVM: EventsViewModel
    
    var event: Event
    
    var body: some View {
        ScrollView {
        VStack {
            Image(event.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            HStack {
            Text(event.title)
                .font(.title)
                Spacer()
            }
            .padding()
            Text(event.description)
                .multilineTextAlignment(.leading)
                .padding()
            Button(action: {
                if let index = eventsVM.events.firstIndex(where: {$0.id == event.id}) {
                    eventsVM.events[index].isAttending = true
                    eventsVM.saveEvents()
                }
                
            }, label: {
                Text("Attend Event")
            })
            
        }
        .padding()
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event.example)
    }
}
