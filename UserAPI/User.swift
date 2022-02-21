//
//  User.swift
//  UserAPI
//
//  Created by Иван Осипов on 17.02.2022.
//

import Foundation
import UIKit

struct Results: Decodable {
    let results: [User]
}

struct User: Decodable {
    let name: Name
    let email: String
    let dob: Dob
    let phone: String
    let picture: Picture
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
    
    func fullName() -> String {
        return "\(self.title) \(self.first) \(self.last)"
    }
}

struct Dob: Decodable {
    let age: Int
}

struct Picture: Decodable {
    let medium: String
}
