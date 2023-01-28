//
//  ContentView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack
        {
            List(0..<100)
            { row in
                NavigationLink
                {
                    Text("Detail \(row)")
                }
                label:
                {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
