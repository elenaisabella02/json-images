//
//  DataParser.swift
//  Json-images
//
//  Created by Elena - Isabella BRAGA on 28.12.2022.
//

import Foundation

struct DataParser {

    static func string(fromData data: Data) -> String {
        guard let string = String(data: data, encoding: .utf8) else { return "" }
        return string
    }

    static func posts(fromData data: Data) -> [Post] {
        var posts = [Post]()
        if let jsonPosts = try? JSONDecoder().decode([Post].self, from: data) {
            posts = jsonPosts
        }
        return posts
    }

}
