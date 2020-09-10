//
//  videosCell.swift
//  febbler
//
//  Created by Bhargava on 29/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVKit
protocol dataTransferDelegate{
    func gotoMessageController(index:Int)
}
class videosCell: UICollectionViewCell {
   
    var indexPath : IndexPath?
    var delegate : dataTransferDelegate?
    
    var transparentView = UIView()
    let navigationController = UINavigationController()
 
    var isLikeClicked = true
    @IBOutlet weak var PlayerView: PlayerViewClass!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var MessageBtn: UIButton!
    @IBOutlet weak var ShareBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var likeCount:UILabel!
    @IBOutlet weak var videoProfileView: UIView!
    @IBOutlet weak var videoProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundCorners(myview: videoProfileView, cornerRadius: 20)
        videoProfileImage.layer.cornerRadius = self.videoProfileImage.frame.height/2
    }
    func roundCorners(myview:UIView,cornerRadius: Double) {
          let path = UIBezierPath(roundedRect: myview.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
          let maskLayer = CAShapeLayer()
          maskLayer.frame = myview.bounds
          maskLayer.path = path.cgPath
          myview.layer.mask = maskLayer
      }
    @IBAction func didTapVideo_Like(_ sender: UIButton) {
        if isLikeClicked{
            LikeBtn.tintColor = .red
            
        }else{
            LikeBtn.tintColor = .lightGray
        }
        isLikeClicked = !isLikeClicked
    }
    @IBAction func didTapMessage(_ sender: UIButton) {
        delegate?.gotoMessageController(index: indexPath?.row ?? 0)
       
        
    }
   
    @IBAction func didTapShare(_ sender: UIButton) {
        
    }
    
    
}

