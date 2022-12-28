//
//  DownloadManager.swift
//  Json-images
//
//  Created by Elena - Isabella BRAGA on 28.12.2022.
//

import Foundation

typealias DownloadCompletionBlock = (_ success: Bool, _ data: Data?) -> Void

struct DownloadManager {

    static func getData(fromPath path: String, completion: @escaping DownloadCompletionBlock) {
        getData(atUrl: URL(string: path), completion: completion)
    }

    private static func getData(atUrl url: URL?, completion: @escaping DownloadCompletionBlock) {
        guard let url = url else {
            completion(false, nil)
            return
        }
        getData(withUrlRequest: URLRequest(url: url), completion: completion)
    }

    private static func getData(withUrlRequest urlRequest: URLRequest?, completion: @escaping DownloadCompletionBlock) {
        guard let urlRequest = urlRequest else {
            completion(false, nil)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("received error: \(error.localizedDescription)")
                completion(false, nil)
            } else if let data = data {
                print("data downloaded successfully")
                completion(true, data)
            } else {
                print("unknown error")
                completion(false, nil)
            }
        }
        dataTask.resume()
        print("AM TERMINAT FUNCTIA")
    }

}
