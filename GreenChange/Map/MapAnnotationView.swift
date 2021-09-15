//
//  MapAnnotationView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-10.
//

import SwiftUI

struct MapAnnotationView: View {
    var body: some View {
        VStack {
            Text("hey")
                .font(.title)
        }
        .frame(width: 200, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .background(Color.init(.displayP3, red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
        .offset(x: 0, y: -110)
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
