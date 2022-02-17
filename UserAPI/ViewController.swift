//
//  ViewController.swift
//  UserAPI
//
//  Created by Иван Осипов on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var users: [Results] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    func getUser() {
        guard let url = URL(string: "https://randomuser.me/api") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let user = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.users.append(user)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
        
    }

}

