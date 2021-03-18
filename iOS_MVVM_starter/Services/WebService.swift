//
//  WebService.swift
//  iOS_MVVM_starter
//
//  Created by เกียรติจารุพัฒน์ สมศรี on 18/3/2564 BE.
//

import Foundation

class Webservice {
    
    func getPosts(url: URL, completion: @escaping (PostModel?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let postList = try? JSONDecoder().decode(PostModel.self, from: data)
                if let postList = postList {
                    completion(postList)
                }
            } else if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
}





