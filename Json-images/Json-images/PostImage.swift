//
//  PostImage.swift
//  Json-images
//
//  Created by Elena - Isabella BRAGA on 28.12.2022.
//

import UIKit

class PostImage : UICollectionViewCell {
    @IBOutlet private weak var postImage: UIImageView!

    func loadPost(_ post: Post) {
        print("loading post with image: \(post.thumbnailUrl)")
        postImage.image = UIImage(named: post.thumbnailUrl)
    }
}
