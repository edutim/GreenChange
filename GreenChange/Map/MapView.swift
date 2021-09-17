//
//  MapView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI
import MapKit
struct MapView: View {
    @State var vm = MapViewModel()
    @EnvironmentObject var eventsVM: EventsViewModel
    @EnvironmentObject var challengesVM: ChallengesViewModel
    @State var updateToggle = false
    
    init() {
        vm.createMapItems()
    }
    
    var body: some View {
        
        Map(coordinateRegion: $vm.mapRegion, interactionModes: .all, showsUserLocation: false, userTrackingMode: $vm.trackingMode, annotationItems: vm.mapItems, annotationContent: { item in
            
            MapAnnotation(coordinate: item.coordinate) {
                if item.annotationType == .challenge {
                    ZStack {
                        Image(systemName: "flag.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(width: 40, height: 40)

//                            .onTapGesture {
//                                let index: Int = vm.mapItems.firstIndex(where: {$0.id == item.id})!
//                                print("Tapped \(index)")
//
//                                vm.mapItems[index].show.toggle()
//                                print(item)
//                                updateToggle.toggle()
//                            }
//                        if item.show {
//                            MapAnnotationView()
//                        }
                    }
                }
                if item.annotationType == .event {
                    ZStack {

                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(width: 40, height: 40)

//                            .onTapGesture {
//                                let index: Int = vm.mapItems.firstIndex(where: {$0.id == item.id})!
//
//                                vm.mapItems[index].show.toggle()
//
//                            }
//                        if item.show {
//                            MapAnnotationView()
//                        }
                    }
                }
                if item.annotationType == .business {
                    ZStack {

                        Image(systemName: "bag.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.darkGreen)
                            .frame(width: 40, height: 40)

//                            .onTapGesture {
//                                let index: Int = vm.mapItems.firstIndex(where: {$0.id == item.id})!
//
//                                vm.mapItems[index].show.toggle()
//
//                            }
//                        if item.show {
//                            MapAnnotationView()
//                        }
                    }
                }
            }
            
        })
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
           
        }
        
    }
    
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.329390, longitude: -83.044933), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
    }
}


