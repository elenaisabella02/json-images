//
//  Post.swift
//  Json-images
//
//  Created by Elena - Isabella BRAGA on 28.12.2022.
//

import Foundation

struct Post : Codable {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
}
