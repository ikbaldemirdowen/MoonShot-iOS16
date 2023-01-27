//
//  ContentView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader
        {
            geo in
            Image("Example")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width)
                .frame(height: geo.size.height)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
