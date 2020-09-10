//
//  keyBoardHelpers.swift
//  febbler
//
//  Created by challa bhargava on 09/09/20.
//  Copyright © 2020 challa bhargava. All rights reserved.
//

import UIKit


extension UIView{
    //Looks for single or multiple taps.
    func keyboardHide(){let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

       self.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.endEditing(true)
    }
    
}
