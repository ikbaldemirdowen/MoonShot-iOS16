//
//  AstronautView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-31.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    var body: some View {
        ScrollView(.vertical)
        {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
            
            Text(astronaut.name)
                .foregroundColor(.white).bold().font(.headline)
            
            Text(astronaut.description)
                .foregroundColor(.white)
                .padding()
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts : [String : Astronaut] = Bundle.main.decode(file: "astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
