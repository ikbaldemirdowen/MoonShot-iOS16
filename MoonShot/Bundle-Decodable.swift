//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Ikbal Demirdoven on 2023-01-30.
//

import Foundation

extension Bundle
{
    // we make this function generic
    func decode<T:Codable>(file : String) -> T
    {
        //first finding the url from the bundle.
        guard let url = self.url(forResource: file, withExtension: nil) else
        {
            fatalError("Couldn't find the \(file)")
        }
        
        //then taking the data inside the file
        guard let data = try? Data(contentsOf: url) else
        {
            fatalError("Couldn't find the \(file)")
        }
        
        //then decoding the data into a variable as [String : Astronaut]
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode(T.self, from: data) else
        {
            fatalError("Failed to decode the \(file) from bundle.")
        }
        
        return decoded
    }
}
