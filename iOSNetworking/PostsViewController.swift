//
//  PostViewController.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/16/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var userId: Int!
    var posts: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId!)") {
            let request = URLRequest(url: url)
            let sharedSession = URLSession.shared
            let task = sharedSession.dataTask(with: request) { (data, response, error) in
                do {
                    if let data = data {
                        self.posts = try JSONDecoder().decode([PostModel].self, from: data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                catch {
                    
                }
            }
            task.resume()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
}
