//
//  ResultsModel.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 31/10/2022.
//

import Foundation

struct Courses: Codable {
    var name, score: String
}

class Result: Codable, ObservableObject {
    var academicYear, semester, averageForSemester, currentCWA, level: String
    var courses: [Courses]
}

class Results: Codable, ObservableObject {
    var results: [Result]
    
    static let loadResults: Results = getClasses(file: "courseData.json")
}
