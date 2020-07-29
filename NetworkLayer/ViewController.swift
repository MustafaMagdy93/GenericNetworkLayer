//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Ahmed masoud on 3/30/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api: UsersAPIProtocol = UsersAPI()
        api.createUser(name: "Mustafa", job: "iOS") { [weak self] (result) in
            switch result {
                
            case .success(let response):
                print("Done!")
                print("name: \(response?.name ?? "")\njob: \(response?.job ?? "")\nid: \(response?.id ?? "")\ncreated at: \(response?.createdAt ?? "")")
            case .failure(let err):
                print("Bad!")
                
                //Show AlertController
                self?.showAlert(messageTitle: "Warning!", messageBody: err.rawValue, actionTitle: "OK")
                print("Error: ", err.rawValue)
            }
        }
//        api.getUsers { (result) in
//            switch result {
//            case .success(let response):
//                let users = response?.data
//                for user in users ?? [] {
//                    print("\(user.name ?? "") => \(user.salary ?? "")")
//                }
//            case .failure(let error):
//                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
//            }
//        }
    }

    func showAlert(messageTitle: String, messageBody: String, actionTitle: String) {
        let alertController = UIAlertController(title: messageTitle, message: messageBody, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
}

