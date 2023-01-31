//
//  ContentView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-27.
//

import SwiftUI

struct ContentView: View {
    //we added this decode method below to Bundle as an extension
    let astronauts : [String : Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions : [Mission] = Bundle.main.decode(file: "missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack
        {
            ScrollView(.vertical)
            {
                LazyVGrid(columns: columns)
                {
                    ForEach(missions)
                    {
                        mission in
                        NavigationLink
                        {
                            Text("\(mission.description)")
                        } label: {
                            VStack
                            {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                VStack
                                {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.launchDate ?? "No launch date.")
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MoonShot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
