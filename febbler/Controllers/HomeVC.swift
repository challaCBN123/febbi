//
//  HomeVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class HomeVC: UIViewController {
    let THEME_COLOUR = UIColor.systemGray.withAlphaComponent(0.5)
     let LOADER_COLOR = UIColor.lightGray
   var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    var titleLabel: UILabel = UILabel()
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnViewHeight: NSLayoutConstraint!
    var myArray = NSArray()
    
     let BaseService = servicesToGetData()
     let baseURl = "https://interview-e18de.firebaseio.com/media.json?print=pretty"
     let serviceUrl = ""
    
    @IBOutlet weak var clView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clViewNibFile()
        self.clView.delegate = self
        self.clView.dataSource = self
        getData()
        if UIScreen.main.bounds.height < 700{
            btnViewHeight.constant = 40
        }
        // Do any additional setup after loading the view.
    }
    func getData(){
        self.startIndicator()
        BaseService.getDataFromUrl(baseUrl: baseURl, serviceUrl: serviceUrl) { (urlData, error) in
            print(urlData)
            if error != nil {
                print(error)
            }
            self.stopIndicator()
            self.myArray = urlData as! NSArray
            //print(self.myArray)
            self.clView.reloadData()
           // self.stopIndicator()
        }
    }
    func clViewNibFile(){
        let nibName = UINib.init(nibName: "videosCell", bundle: nil)
        self.clView.register(nibName, forCellWithReuseIdentifier: "videosCell")
    }
    @IBAction func didTap_Home(_ sender: UIButton) {
        self.clView?.scrollToItem(at: IndexPath(item: 0, section: 0) as IndexPath,at: .top,animated: true)
    }
    @IBAction func didTap_Camera(_ sender: UIButton) {
        
    }
    @IBAction func didTap_Search(_ sender: UIButton) {
        goToSearchController()
    }
    @IBAction func didTap_Notifications(_ sender: UIButton) {
      goToNotificationController()
    }
    @IBAction func didTap_SignIn(_ sender: UIButton) {
       goToLogInController()
    }
    
    
}
extension HomeVC{
    func goToSearchController(){
        let searchController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.present(searchController, animated: true, completion: nil)
    }
    func goToNotificationController(){
          let notificationController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NotificationVC") as! NotificationVC
                 self.navigationController?.present(notificationController, animated: true, completion: nil)
       }
    func goToLogInController(){
             let logInController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
                    self.navigationController?.present(logInController, animated: true, completion: nil)
          }
     func startIndicator()
    {
        //creating view to background while displaying indicator
        let container: UIView = UIView()
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = THEME_COLOUR

        //creating view to display lable and indicator
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 118, height: 80)
        loadingView.center = self.view.center
        loadingView.backgroundColor =  LOADER_COLOR
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10

        //Preparing activity indicator to load
        self.activityIndicator = UIActivityIndicatorView()
        self.activityIndicator.frame = CGRect(x: 40, y: 12, width: 40, height: 40)
        self.activityIndicator.style = UIActivityIndicatorView.Style.large
        loadingView.addSubview(activityIndicator)

        //creating label to display message
        let label = UILabel(frame: CGRect(x: 5, y: 55,width: 120,height: 20))
        label.text = "Loading..."
        label.textColor = UIColor.white
        label.bounds = CGRect(x: 0, y: 0, width: loadingView.frame.size.width / 2, height: loadingView.frame.size.height / 2)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        loadingView.addSubview(label)
        container.addSubview(loadingView)
        self.view.addSubview(container)

        self.activityIndicator.startAnimating()
    }
    func stopIndicator()
    {
        UIApplication.shared.endIgnoringInteractionEvents()
            self.activityIndicator.stopAnimating()
        ((self.activityIndicator.superview as UIView?)?.superview as UIView?)!.removeFromSuperview()
    }
    
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,dataTransferDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clView.dequeueReusableCell(withReuseIdentifier: "videosCell", for: indexPath) as! videosCell
        cell.indexPath? = indexPath
        cell.delegate = self
        let dataDict = myArray[indexPath.row] as! NSDictionary
        cell.titleLbl.text = "@\(dataDict.value(forKey: "title") as! String)"
        cell.likeCount.text = String(100)
        let webURl = dataDict.value(forKey: "url") as! String
        guard let videoUrl = URL(string: webURl) else {fatalError()}
       
            //Video player
            let avPlayer = AVPlayer(url:videoUrl)
        cell.PlayerView.playerLayer.player = avPlayer
        cell.PlayerView.player?.play()
        return cell
    }
  
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let cell = cell as? videosCell else {return}
//        let visibleCells = clView.visibleCells
//        let minIndex = visibleCells.startIndex
//        if clView.visibleCells.firstIndex(of: cell) == minIndex {
//            cell.PlayerView.player?.play()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//         guard let cell = cell as? videosCell else {return}
//        cell.PlayerView.player?.pause()
//        cell.PlayerView.player = nil
//        
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizes = self.clView.frame
        let size = CGSize(width: sizes.width , height: sizes.height)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func gotoMessageController(index: Int) {
          presentMsgVc()
      }
      func presentMsgVc(){
          let storyBoard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "messageVC") as! messageVC
          storyBoard.modalPresentationStyle = .custom
          self.navigationController?.present(storyBoard, animated: true, completion: nil)
      }
}
extension HomeVC: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        clView.visibleCells.forEach { cell in
            // TODO: write logic to stop the video before it begins scrolling
            guard let cell = cell as? videosCell else {return}
                   let visibleCells = clView.visibleCells
                   let minIndex = visibleCells.startIndex
                   if clView.visibleCells.firstIndex(of: cell) == minIndex {
                       cell.PlayerView.player?.play()
                   }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        clView.visibleCells.forEach { cell in
            // TODO: write logic to start the video after it ends scrolling
            guard let cell = cell as? videosCell else {return}
                   cell.PlayerView.player?.pause()
                   cell.PlayerView.player = nil
        }
    }
}
