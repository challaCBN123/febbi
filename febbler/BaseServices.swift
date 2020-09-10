//
//  BaseServices.swift
//  interViewTask
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire

class servicesToGetData:NSObject{
    func getDataFromUrl(baseUrl:String,serviceUrl:String,completionHandler: @escaping (_ urlData:AnyObject,_ error:String)-> Void){
        AF.request(baseUrl+serviceUrl,method: .get,encoding: JSONEncoding.default).responseJSON { (urlData) in
           // print(urlData.value!)
            switch urlData.result{
            case .success(_):
                completionHandler(urlData.value! as AnyObject, "")
                break
            case .failure(_):
                let temp : [AnyObject] = []
                completionHandler(temp as AnyObject, urlData.error!.localizedDescription)
                break
            }
        }
    }
}
