//
//  UserModel.swift
//  JustoChallenge
//
//  Created by Miguel Elduque on 30/07/23.
//

import Foundation

// MARK: - Welcome
struct Results: Codable {
    let results: [Result]
    let info: Info
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
    
    func convertDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        guard let newDate = dateFormatter.date(from: date) else {
            print("Wrong Format")
            return "N/A"
        }
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        let dateString = dateFormatter.string(from: newDate)
        return dateString
    }
}

// MARK: - ID
struct ID: Codable {
    let name, value: String?
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
    
    func fullStreet() -> String {
        return "\(name) #\(number)"
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, description: String
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
    
    func fullName(withTitle: Bool) -> String {
        let fullName = withTitle ? "\(title) \(first) \(last)" : "\(first) \(last)"
        return fullName
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
