//
//  utilities.swift
//  interViewTask
//
//  Created by Bhargava on 24/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class customBtn:UIButton{
    @IBInspectable var borderwidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderwidth
        }
    }
    @IBInspectable var cornerradius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerradius
        }
    }
    @IBInspectable var borderColor:UIColor?{
        didSet{
            self.layer.borderColor = borderColor?.cgColor
        }
    }
}

class customView:UIView{
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor?{
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
}

