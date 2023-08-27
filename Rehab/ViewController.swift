//
//  ViewController.swift
//  Rehab
//
//  Created by Maxim Mitin on 27.08.23.
//

import UIKit

class ViewController: UIViewController {
    var peoples: [Person] = []
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkManager.shared.getPeople { response in
            switch response{
            case .success(let peoples):
                print(peoples)
                self.peoples = peoples.results
            case.failure(let error):
                print(error)
            }
        }
    }

    @IBAction func btnCLicked(_ sender: Any) {
        
        
        for i in peoples {
            print(i)
        }
    }
    

}

