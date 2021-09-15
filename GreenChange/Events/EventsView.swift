//
//  EventsView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

struct EventsView: View {
    @EnvironmentObject var eventsVM: EventsViewModel
    
    @State private var selectedFilter = 0
    
    var body: some View {
        NavigationView() {
            
            VStack(spacing: 10) {
                Picker("Hey", selection: $selectedFilter, content: {
                    Text("All").tag(0)
                    Text("Attending").tag(1)
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                CalendarView()
                if selectedFilter == 0 {
                    List(eventsVM.events) { event in
                        NavigationLink(destination: EventDetailView(event: event), label: {
                            EventCardView(event: event)
                        })
                    }
                    .listStyle(PlainListStyle())
                }
                if selectedFilter == 1 {
                    List(eventsVM.events.filter {$0.isAttending}) { event in
                        NavigationLink(destination: EventDetailView(event: event), label: {
                            EventCardView(event: event)
                        })
                    }
                    .listStyle(PlainListStyle())
                }
                
            }
            .navigationTitle("Events")
            
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
