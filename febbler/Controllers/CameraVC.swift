//
//  CameraVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    

    @IBAction func didTapBack(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
