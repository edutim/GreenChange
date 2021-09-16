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
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                HStack {
                    Text(event.title)
                        .font(.title)
                    Spacer()
                }
                .padding()
                Button(action: {
                    if let index = eventsVM.events.firstIndex(where: {$0.id == event.id}) {
                        eventsVM.events[index].isAttending = true
                        eventsVM.saveEvents()
                    }
                    
                }, label: {
                    event.isAttending ? Text("Attending Event").lineLimit(2) : Text("Attend Event").lineLimit(2)
                })
                Text(event.description)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                    HStack(alignment: .top) {
                        
                        VStack {
                            Text("Address")
                                .font(.title)
                            Text(event.address)
                        }
                        .frame(width: 175)
                        VStack {
                            Text("Date")
                                .font(.title)
                            Text(event.date)
                        }
                        .frame(width: 175)
                    }
                    .padding()
                Text("Potential Points")
                    .font(.title)
                Text("\(event.potentialPoints) GreenChange")
                Spacer()
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
