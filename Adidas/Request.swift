//
//  Request.swift
//  Adidas
//
//  Created by Borja Rodriguez Sánchez on 24/6/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import Foundation
import UIKit

class Request{
    //vartake out main url root, so if we must change between different servers such as dev/pre/prod to test in each, we just have to change it at one place.
    let url :String = "http://www.cursoswordpressintensivo.com/adidas/"
    
    func saveInfo( userEmail:String, firstName:String, lastName:String, dateOfBirth:String, country:String){
        /*let myUrl = NSURL(string: "\(url)SaveUserInfo.php")
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "POST"
        let postString = "email=\(userEmail)&firstName=\(firstName)&lastName=\(lastName)&dateOfBirth=\(dateOfBirth)&country=\(country)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {(response, data, error) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
        
        }*/
        
        let myUrl = NSURL(string: "\(url)SaveUserInfo.php")
        let request: NSMutableURLRequest = NSMutableURLRequest(url: myUrl as! URL)
        request.httpMethod = "POST"
        let postString = "email=\(userEmail)&firstName=\(firstName)&lastName=\(lastName)&dateOfBirth=\(dateOfBirth)&country=\(country)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let dataVal: NSData =  try! NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil) as NSData
        let _: NSError?
        do{
            let parsedObject = try JSONSerialization.jsonObject(with: dataVal as Data) as? NSDictionary
            let status = parsedObject?["status"] as? String

            if status == "Success"{
                let alert = UIAlertView()
                alert.title = "Good News!"
                alert.message = "Now you are part of our Adidas special membership!"
                alert.addButton(withTitle: "OK")
                alert.show()
            }else{
                let alert = UIAlertView()
                alert.title = "Ops"
                alert.message = "Looks like you already registered with this account"
                alert.addButton(withTitle: "OK")
                alert.show()
            }
        }catch{
            print("Error")
        }
    }
    
    
   /* func eventInfo(){
        let myUrl = NSURL(string: "\(url)eventConfig.php")
        let request = NSMutableURLRequest(url: myUrl! as URL)
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {(response, data, error) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            
        }
    }*/
    
    func eventInfo(){
        let myUrl = NSURL(string: "\(url)eventConfig.php")
        let request: NSMutableURLRequest = NSMutableURLRequest(url: myUrl as! URL)
        
        let dataVal: NSData =  try! NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil) as NSData
        let _: NSError?
        do{
            let parsedObject = try JSONSerialization.jsonObject(with: dataVal as Data) as? NSDictionary
            let name = parsedObject?["name"] as? String
            let direcction = parsedObject?["direcction"] as? String
            let bannerImage = parsedObject?["bannerImage"] as? String
            event.name = name!
            event.address = direcction!
            event.bannerImage = bannerImage!
            
        }catch{
            print("Error")
        }

    }
}
var event = Event()
