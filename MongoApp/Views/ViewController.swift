//
//  ViewController.swift
//  MongoApp
//
//  Created by Daniel Nzioka on 6/4/20.
//  Copyright © 2020 Daniel Nzioka. All rights reserved.
//

import UIKit
import MongoSwift
import StitchCore

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if stitch.auth.isLoggedIn {
            self.present(UploadViewController(), animated: true)
        } else {
            let alertController = UIAlertController(title: "Login to Stitch", message: "Anonymous Login", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Login", style: .default, handler: { [unowned self] _ -> Void in
                stitch.auth.login(withCredential: AnonymousCredential()) { [weak self] result in
                    switch result {
                    case .failure(let e):
                        fatalError(e.localizedDescription)
                    case .success:
                        DispatchQueue.main.async {
                            self?.present(UploadViewController(), animated: true)
                        }
                    }
                }
            }))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

}

