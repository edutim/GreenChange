//
//  CalendarView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-13.
//

import SwiftUI

struct CalendarView: View {
    let framewidth:CGFloat = 40
    let frameHeight: CGFloat = 30
    var body: some View {
        VStack{
            Text("September 2021")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                
            HStack{
                Text("29")
                    .foregroundColor(Color.gray)
                    .frame(width: framewidth, height: frameHeight)
                Text("30")
                    .foregroundColor(Color.gray)
                    .frame(width: framewidth, height: frameHeight)
                Text("31")
                    .foregroundColor(Color.gray)
                    .frame(width: framewidth, height: frameHeight)
                Text("1")
                    .frame(width: framewidth, height: frameHeight)
                Text("2")
                    .frame(width: framewidth, height: frameHeight)
                Text("3")
                    .frame(width: framewidth, height: frameHeight)
                ZStack {
                    Circle()
                        .frame(width: framewidth, height: frameHeight)
                        .foregroundColor(.green)

                Text("4")
                    .frame(width: framewidth, height: frameHeight)
                }
            }
            HStack{
                Text("5")
                    .frame(width: framewidth, height: frameHeight)
                Text("6")
                    .frame(width: framewidth, height: frameHeight)
                Text("7")
                    .frame(width: framewidth, height: frameHeight)
                Text("8")
                    .frame(width: framewidth, height: frameHeight)
                Text("9")
                    .frame(width: framewidth, height: frameHeight)
                Text("10")
                    .frame(width: framewidth, height: frameHeight)
                Text("11")
                    .frame(width: framewidth, height: frameHeight)
            }
            HStack{
                Text("12")
                    .frame(width: framewidth, height: frameHeight)
                Text("13")
                    .frame(width: framewidth, height: frameHeight)
                Text("14")
                    .frame(width: framewidth, height: frameHeight)
                Text("15")
                    .frame(width: framewidth, height: frameHeight)
                Text("16")
                    .frame(width: framewidth, height: frameHeight)
                ZStack {
                    Circle()
                        .frame(width: framewidth, height: frameHeight)
                        .foregroundColor(.green)
                    Text("17")
                        .frame(width: framewidth, height: frameHeight)
                }
                Text("18")
                    .frame(width: framewidth, height: frameHeight)
            }
            HStack{
                Text("19")
                    .frame(width: framewidth, height: frameHeight)
                Text("20")
                    .frame(width: framewidth, height: frameHeight)
                ZStack{
                    Circle()
                        .frame(width: framewidth, height: frameHeight)
                        .foregroundColor(.green)
                Text("21")
                    .frame(width: framewidth, height: frameHeight)
                }
                Text("22")
                    .frame(width: framewidth, height: frameHeight)
                Text("23")
                    .frame(width: framewidth, height: frameHeight)
                Text("24")
                    .frame(width: framewidth, height: frameHeight)
                Text("25")
                    .frame(width: framewidth, height: frameHeight)
            }
            HStack{
                Text("26")
                    .frame(width: framewidth, height: frameHeight)
                Text("27")
                    .frame(width: framewidth, height: frameHeight)
                Text("28")
                    .frame(width: framewidth, height: frameHeight)
                Text("29")
                    .frame(width: framewidth, height: frameHeight)
                Text("30")
                    .frame(width: framewidth, height: frameHeight)
                Text("1")
                    .foregroundColor(Color.gray)
                    .frame(width: framewidth, height: frameHeight)
                Text("2")
                    .foregroundColor(Color.gray)
                    .frame(width: framewidth, height: frameHeight)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
