//
//  ViewController.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/2/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        
        // https://goo.gl/wV9G4I
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                do {
                    if let data = data {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        self.users = users
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
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

