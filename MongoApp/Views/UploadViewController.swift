//
//  UploadViewController.swift
//  MongoApp
//
//  Created by Daniel Nzioka on 6/4/20.
//  Copyright © 2020 Daniel Nzioka. All rights reserved.
//

import UIKit
import MongoSwift

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        uploadContact()
    }
    
    func uploadContact() {
        
        let contact = Contact(
            _id: ObjectId(),
            name: "Daniel",
            email: "Kioko")
        
        contatcsCollection.insertOne(contact) { (result) in
            switch result {
            case .failure(let e):
                print("error inserting item, \(e.localizedDescription)")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "OOPS!", message: "Something's wrong", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .success:
                print("successfully inserted a document")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Hurray!", message: "You've just uploaded your first document. Congrats!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

}

