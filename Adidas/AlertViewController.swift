//
//  AlertViewController.swift
//  Adidas
//
//  Created by Borja Rodriguez Sánchez on 24/6/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class AlertViewController: UIAlertController {
    //Variable
    let top = UIApplication.shared.keyWindow?.rootViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(userMessage :String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
    
        
        top?.present(myAlert,animated:true, completion:nil)
    }
    
    func displayMyCancelMessage(userMessage :String){
        
        let dismissHandler = {
            (action: UIAlertAction!) in
            self.exitApp()
        }
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(cancelAction)
        myAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: dismissHandler))
        top?.present(myAlert,animated:true, completion:nil)
    }
    func exitApp(){
        exit(0)
    }


}
