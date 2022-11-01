//
//  NextClassModel.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 31/10/2022.
//

import Foundation

struct Class: Codable {
    var courseCode, courseName, location, classroom, time, lecturerTitle, lecturerName: String
}

class NextClass: Codable, ObservableObject {
    var classes: [Class]
    
    static let loadClasses: NextClass = getClasses(file: "nextClasses.json")
    
    
}
func getClasses<T: Decodable>(file: String) -> T {
    guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
        fatalError("Could not find \(file) in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Could not load \(file) in bundle.")
    }
    
    let decoder = JSONDecoder()
    
    guard let loadedClasses = try? decoder.decode(T.self, from: data) else {
        fatalError("Could not decode \(file) in bundle.")
    }
    
    return loadedClasses
}
