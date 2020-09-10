//
//  messageVC.swift
//  febbler
//
//  Created by Bhargava on 02/09/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
class messageVC: UIViewController {
    // to store the current active TextView
     var activeTextView : UITextView? = nil
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var dismissView: UIView!
    
    @IBOutlet weak var childViewHeight: NSLayoutConstraint!
    @IBOutlet weak var commentsTxtViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var commentsTblView: UITableView!
    
    @IBOutlet weak var CommentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.main.bounds.height < 700{
            childViewHeight.constant = 380
        }
        CommentsTextView.delegate = self
        view.keyboardHide()
        self.CommentsTextView.contentInset = UIEdgeInsets(top: 9, left: 20, bottom: 5, right: 4)
        self.roundCorners(myview: childView, cornerRadius: 20)
        CommentsTextView.layer.cornerRadius = 30
        CommentsTextView.text = "Comment Here"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.dismissView.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(messageVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(messageVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
      // move the root view up by the distance of keyboard height
      self.view.frame.origin.y = 0 - keyboardSize.height
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
  
 
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
 
    private func roundCorners(myview:UIView,cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: myview.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = myview.bounds
        maskLayer.path = path.cgPath
        myview.layer.mask = maskLayer
    }
    @IBAction func didTapDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSendComments(_ sender: UIButton) {
    }
    

}
extension messageVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView){
        self.activeTextView = textView
    }
    func textViewDidEndEditing(_ textView: UITextView){
        self.activeTextView = nil
    }
}
