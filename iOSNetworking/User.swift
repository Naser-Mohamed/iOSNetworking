//
//  User.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/2/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    
    var company: Company
    var address: Address
    
}

struct Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
    
}

struct Geo: Codable{
    var lat: String
    var lng: String
    
}

struct Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}
