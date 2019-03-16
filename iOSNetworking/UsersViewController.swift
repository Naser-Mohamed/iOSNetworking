//
//  UsersViewController.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/16/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            let request = URLRequest(url: url)
            let sharedSession = URLSession.shared
            let task = sharedSession.dataTask(with: request) { (data, response, error) in
                do {
                    if let data = data {
                        self.users = try JSONDecoder().decode([User].self, from: data)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? UserInfoVC,
              let selectedPath = tableView.indexPathForSelectedRow else { return }
        vc.user = users[selectedPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
