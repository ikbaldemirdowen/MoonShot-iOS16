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
                            MissionView(mission: mission)
                        } label: {
                            VStack
                            {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack
                                {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
