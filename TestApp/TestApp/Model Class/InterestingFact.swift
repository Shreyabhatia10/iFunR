//
//  InterestingFact.swift
//  TestApp
//
//  Created by Shreya Bhatia on 31/01/20.
//  Copyright © 2020 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

struct InterestingFact: Decodable {
    
    var factImageName: String
    var factDescription: String
    
    enum CodingKeys: String, CodingKey {
        case factImageName = "imageURL"
        case factDescription = "fact"
    }
}
