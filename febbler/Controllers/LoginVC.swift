//
//  LoginVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class LoginVC: UIViewController  {
  
    @IBOutlet weak var loginView: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
                     
     
    }
//   func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//         if let error = error {
//         print(error.localizedDescription)
//         return
//         }
//         guard let auth = user.authentication else { return }
//         let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
//         Auth.auth().signIn(with: credentials) { (authResult, error) in
//         if let error = error {
//         print(error.localizedDescription)
//         }
//
//            print("login successful")
//         //This is where you should add the functionality of successful login
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                      let ProfVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//                    let profileName = user.profile.name
//                    guard let name = profileName else {return}
//                    ProfVC.profileNames = name
//                    let imageURl = user.profile.imageURL(withDimension: .min)!
//                    let data = try? Data(contentsOf: imageURl)
//                    guard let imageData = data else{
//                        return
//                    }
//                    let profileImage = UIImage(data: imageData)
//                    if let Image = profileImage{
//
//                             ProfVC.profileImages = Image
//                    }
//
//                      self.present(ProfVC, animated: false, completion: nil)
//
//         //i.e. dismissing this view or push the home view controller etc
//
//    }
           
     //}
//
//     func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        if error != nil {
//            print(error.localizedDescription)
//             }
//        self.navigationController?.dismiss(animated: true, completion: nil)
//
//     }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
               
    GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func didTapBack(_ sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
   
}
