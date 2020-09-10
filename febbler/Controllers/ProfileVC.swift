//
//  ProfileVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    var profileNames = String()
    var profileImages = UIImage()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var followersCountLbl: UILabel!
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var videoCountLbl: UILabel!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var likesCountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = profileImages
        profileName.text = profileNames
        //profileImage.image = profileImages
        followersCountLbl.text = String(20)
        videoCountLbl.text = String(20)
        likesCountLbl.text = String(20)
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
