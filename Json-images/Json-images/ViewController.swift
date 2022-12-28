//
//  ViewController.swift
//  Json-images
//
//  Created by Elena - Isabella BRAGA on 28.12.2022.
//

import UIKit

class ViewController: UIViewController {

    var posts = [Post]()
    @IBOutlet private weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        DownloadManager.getData(fromPath: "https://jsonplaceholder.typicode.com/photos") { success, data in
            if success, let data = data {
                self.posts = DataParser.posts(fromData: data)
                print("number of posts: \(self.posts.count)")
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
    }

    func prepareTable() {
        collectionView?.register(UINib(nibName: "ImageCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ImageCell")
    }

    func showAlert(withPost post: Post) {
        let alert = UIAlertController(title: post.url, message: post.thumbnailUrl, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }

}
extension ViewController: UICollectionViewDelegate {

    func collectionView(_ tableView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows: \(posts.count)")
        return posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImage", for: indexPath)
        if let cell = cell as? PostImage {
            let post = posts[indexPath.row]
            cell.loadPost(post)
        }
        return cell
    }
}

