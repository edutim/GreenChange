//
//  CompostIt.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-15.
//

import SwiftUI
import AVKit

struct CompostIt: View {
    
    @State var currentProgress = 50.0
    
    var body: some View {
        ScrollView() {
        VStack() {
            Group {
            HStack {
                Text("Compost it")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title)
                
                Spacer()
            }
            .padding()
            
            NavigationLink(
                destination: VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "compost", withExtension: "mp4")!)),
                label: {
                    Text("Watch Video to Learn More")
                })
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .font(.headline)
                .background(Color.green)
                .cornerRadius(20)
            
                ProgressView("Progress", value: currentProgress, total: 100)
                    
                    .padding()
            
            }
            HStack {
                Text("Directions")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Text("Start composting. Take a picture of your pile for 4 weeks to earn 300 GreenChange.")
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                
            Divider()
            Group {
            HStack {
                Text("Week 1")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.green)
                })
            }
            .padding(.horizontal)
            Divider ()
            HStack {
                Text("Week 2")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.green)
                })
            }
            .padding(.horizontal)
            Divider ()
            HStack {
                Text("Week 3")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "camera.fill")
                        .foregroundColor(Color.green)
                })
            }
            .padding(.horizontal)
            Divider ()
            HStack {
                Text("Week 4")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "camera.fill")
                        .foregroundColor(Color.green)
                })
            }
            .padding(.horizontal)
            }
            Group{
                Text("Compost Gallery")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                
                VStack() {
                    
//                        Image("Food")
//                            .resizable()
//                            .frame(width: 200, height: 200)
                        
                      

                    HStack {
                        Image("compost1")
                                .resizable()
                            .frame(width: 100, height: 100)
                        Image("compost2")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
         
                }

            }
    
            
        }
        .padding()
            
        }
    }
}

struct CompostIt_Previews: PreviewProvider {
    static var previews: some View {
        CompostIt()
    }
}
