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
        
//        UserDefaults.standard.set(true, forKey: "isLogged")
//        UserDefaults.standard.synchronize()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Confitrm", message: "Confirm to open user info", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .default) { (action) in
            print("cacnel btn clicked")
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] (action) in
            self?.presentUserInfo(at: indexPath.row)
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            alert.popoverPresentationController?.sourceView = cell
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func presentUserInfo(at index: Int) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserInfoVC") as! UserInfoVC
        vc.user = users[index]
        navigationController?.pushViewController(vc, animated: true)
    }
}
