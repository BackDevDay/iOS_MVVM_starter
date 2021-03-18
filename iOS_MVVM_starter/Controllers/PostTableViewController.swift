//
//  PostTableViewController.swift
//  iOS_MVVM_starter
//
//  Created by เกียรติจารุพัฒน์ สมศรี on 18/3/2564 BE.
//

import Foundation
import UIKit

class PostTableViewController : UITableViewController {
    
    private var postListViewModel : PostListViewModel!
    
    override func viewDidLoad() {
        setUI()
        getData()
    }
    
    func setUI() {
        self.title = "Posts"
        
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
          navigationController?.navigationBar.barTintColor = .darkGray
          navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
     }

    
    func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        Webservice().getPosts(url: url) { posts in
            if let posts = posts {
                self.postListViewModel = PostListViewModel(posts: posts)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension PostTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.postListViewModel == nil ? 0 : self.postListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            fatalError("Error")
        }
        
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        
        cell.titleLb.text = postViewModel.title
        cell.bodyLb.text = postViewModel.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



