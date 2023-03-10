//
//  MissionView.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-30.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember
    {
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    var body: some View {
        GeometryReader
        { geo in
            ScrollView
            {
                VStack
                {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.5)
                        .padding(.top)
                    Spacer(minLength: 5)
                    Text("\(mission.formattedLaunchDate)")
                    
                    VStack(alignment: .leading)
                    {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Mission highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        HStack
                        {
                            ForEach(crew, id: \.role)
                            {
                                crewMember in
                                NavigationLink
                                {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack
                                    {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            )
                                        VStack(alignment: .leading)
                                        {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission : Mission, astronauts : [String : Astronaut])
    {
        self.mission = mission
        self.crew = mission.crew.map
        {
            member in
            if let astronaut = astronauts[member.name]
            {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else
            {
                fatalError("Couldn't find the \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions : [Mission] = Bundle.main.decode(file: "missions.json")
    static let astronauts : [String : Astronaut] = Bundle.main.decode(file: "astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
