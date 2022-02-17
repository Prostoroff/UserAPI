//
//  UserInfoViewController.swift
//  UserAPI
//
//  Created by Иван Осипов on 17.02.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: Results?
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewC = segue.destination as! ViewController
        user = viewC.users.first
    }
}

extension UserInfoViewController {
    
    
    private func getUserInfo() {
        
        let user = self.user?.results.first
        
        self.nameLabel.text = user?.name.fullName()
        self.emailLabel.text = user?.email
        self.ageLabel.text = "\(user?.dob.age ?? 0)"
        self.phoneLabel.text = user?.phone
        
    }
}
