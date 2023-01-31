//
//  Missions.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-30.
//

import Foundation

struct Mission : Codable, Identifiable
{
    let id : Int
    let launchDate : Date?
    let crew : [CrewRole]
    let description : String
    
    struct CrewRole : Codable
    {
        let name : String
        let role : String
    }
    
    var displayName : String
    {
        return "Apollo \(id)"
    }
    
    var image : String
    {
        return "apollo\(id)"
    }
    
    var formattedLaunchDate : String
    {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "No launch date."
    }
}
