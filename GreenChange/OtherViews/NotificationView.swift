//
//  NotificationView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-02.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Close")
                })
            }
            .padding()
            
            NavigationView {
                List {
                    NavigationLink (
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                        label: {
                            VStack {
                                HStack {
                                    Circle()
                                        .frame(width: 12.0, height: 20.0)
                                        .foregroundColor(.red)
                                    Text("New Challenge!")
                                        .font(.headline)
                                        .foregroundColor(Color.green)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text ("Litter Walk")
                                        .foregroundColor(Color.gray)
                                        .padding(.leading)
                                    Spacer()
                                }
                            }
                        })
                    NavigationLink (
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                        label: {
                            VStack {
                                HStack {
                                    Circle()
                                        .frame(width: 12.0, height: 20.0)
                                        .foregroundColor(.red)
                                    Text("New Event!")
                                        .font(.headline)
                                        .foregroundColor(Color.green)
                                    Spacer()
                                }
                                Text("Detroit River Shoreline Clean Up")
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 44.0)
                            }
                        })
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            VStack {
                                HStack {
                                    Circle()
                                        .frame(width: 12.0, height: 20.0)
                                        .foregroundColor(.red)
                                    Text("New Balance!")
                                        .font(.headline)
                                        .foregroundColor(Color.green)
                                    Spacer()
                                }
                                Text("James sent you GreenChange")
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 58.0)
                                
                            }
                            
                        })
                }
                .navigationTitle("Notifications")
            }
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
