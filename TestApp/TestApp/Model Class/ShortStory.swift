//
//  ShortStory.swift
//  TestApp
//
//  Created by Shreya Bhatia on 31/01/20.
//  Copyright © 2020 Shreya Bhatia. All rights reserved.
//

import Foundation

struct ShortStory: Decodable {
    
    var title: String
    var story: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case story = "story"
    }
}
