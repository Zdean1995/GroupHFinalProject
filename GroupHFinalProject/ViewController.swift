//
//  ViewController.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-03-22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navigateNewOrder(_ sender: UIButton) {
        // Using storyboard
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "NewOrderViewController") as! NewOrderViewController
//        self.navigationController?.pushViewController(storyboard, animated:true)
        
        // Using Segue
        self.performSegue(withIdentifier: "newOrder", sender: self)
    }
    
    @IBAction func navigatePrevOrders(_ sender: UIButton) {
        self.performSegue(withIdentifier: "prevOrders", sender: self)
    }
}

