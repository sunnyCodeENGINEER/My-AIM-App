//
//  UserDataModel.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 27/10/2022.
//

import Foundation

struct Address: Codable {
    var studentAddress, city, region, postalCode: String
}

struct PhoneNumber: Codable {
    var type, number: String
}

class User: Codable, ObservableObject {
    var firstName, surname, otherNames, title, gender: String
    var age: Int
    var image: String
    var address: Address
    var phoneNumbers: [PhoneNumber]
    var course, id, birthDay, schoolEmail, residentialAddress1, residentialAddress2, postalAddress, nationality, religion: String
    
    static let loadUser: User = Bundle.main.decode(file: "user.json")
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find\(file) in the project.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project.")
        }
        
        return loadedData
    }
}
