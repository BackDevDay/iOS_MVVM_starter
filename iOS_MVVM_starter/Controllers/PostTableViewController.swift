//
//  PostTableViewController.swift
//  iOS_MVVM_starter
//
//  Created by เกียรติจารุพัฒน์ สมศรี on 18/3/2564 BE.
//

import Foundation
import UIKit

class PostTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        Webservice().getPosts(url: url) { posts in
            if let posts = posts {
                print("postsposts \(posts)")
//                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
