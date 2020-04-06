//
//  FunnyImage.swift
//  TestApp
//
//  Created by Shreya Bhatia on 31/01/20.
//  Copyright © 2020 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

struct FunnyImage: Decodable {
    
    var imageUrl: String
    var imageTitle: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "imageUrl"
        case imageTitle = "title"
    }
}
