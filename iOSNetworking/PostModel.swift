//
//  PostModel.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/16/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import UIKit

struct PostModel: Codable {
    var userId: Int!
    var id: Int!
    var title: String!
    var body: String!
}
