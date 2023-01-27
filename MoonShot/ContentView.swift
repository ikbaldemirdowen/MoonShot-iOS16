//
//  ContentView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal)
        {
            LazyHStack(spacing: 5)
            {
                ForEach(0..<1000)
                {
                    Text("Row\($0)")
                        .font(.title)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
