//
//  NotificationVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapBack(_ sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }

}
