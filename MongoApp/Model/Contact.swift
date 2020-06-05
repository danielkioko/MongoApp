//
//  Contact.swift
//  MongoApp
//
//  Created by Daniel Nzioka on 6/4/20.
//  Copyright © 2020 Daniel Nzioka. All rights reserved.
//

import Foundation
import MongoSwift

class Contact: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case name = "name"
        case email = "email"
    }
    
    var _id:ObjectId
    var name: String = ""
    var email: String = ""
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(ObjectId.self, forKey: ._id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
    }
    
    init(_id: ObjectId, name: String, email: String){
        self._id = _id
        self.name = name
        self.email = email
    }

}







