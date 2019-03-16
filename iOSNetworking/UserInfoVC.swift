//
//  UserInfoVC.swift
//  iOSNetworking
//
//  Created by Naser Mohamed on 3/16/19.
//  Copyright © 2019 Naser Mohamed. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = user.name
        phoneLbl.text = user.phone
        emailLbl.text = user.email
        addressLbl.text = user.address.street
        companyLbl.text = user.company.name
        websiteLbl.text = user.website
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let postsVC = segue.destination as? PostsViewController {
            postsVC.userId = user.id
        }
    }
}
