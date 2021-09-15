//
//  SettingsView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-13.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    NavigationLink("Change Notifications", destination: Text("Change Notifications"))
                    NavigationLink("FAQs", destination: Text("FAQs"))
                    NavigationLink("Update Account Information", destination: AccountInformationView())
                    
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                                    trailing:
                                        Button("Done") {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                )
            }
        }
    }
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
