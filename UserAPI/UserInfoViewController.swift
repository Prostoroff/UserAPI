//
//  UserInfoViewController.swift
//  UserAPI
//
//  Created by Иван Осипов on 17.02.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let networkService = NetworkService()
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImage.layer.cornerRadius = 64
        
        let urlString = "https://randomuser.me/api/"
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let user):
                guard let stringURL = user.results.first?.picture.medium,
                      let imageURL = URL(string: stringURL),
                      let imageData = try? Data(contentsOf: imageURL) else {return}
                self?.userImage.image = UIImage(data: imageData)
                self?.nameLabel.text = "Name: \(user.results.first?.name.fullName() ?? "name")"
                self?.emailLabel.text = "Email: \(user.results.first?.email ?? "email")"
                self?.ageLabel.text = "Age: \(String(user.results.first?.dob.age ?? 0))"
                self?.phoneLabel.text = "Phone: \(user.results.first?.phone ?? "phone")"
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
