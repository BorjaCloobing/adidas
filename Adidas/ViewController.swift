//
//  ViewController.swift
//  Adidas
//
//  Created by Borja Rodriguez Sánchez on 23/6/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextfield: SearchTextField!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextfield: UITextField!
    @IBOutlet weak var countryTextfield: SearchTextField!
    @IBOutlet weak var gradientView: UIImageView!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var addressEvent: UILabel!
    @IBOutlet weak var bannerImageEvent: UIImageView!
    
    var gradientLayer: CAGradientLayer!
    let datePicker = UIDatePicker()
    let request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request.eventInfo()
        createGradientLayer()
        createDatePicker()
        configEventInfo()
        configEmailTextField()
        configCountryField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButton(_ sender: Any) {
        
        let userEmail = emailTextfield.text
        let firstName = firstNameTextfield.text
        let lastName = lastNameTextField.text
        let country = countryTextfield.text
        let dateOfBirth = dateOfBirthTextfield.text
        
        if ((userEmail?.isEmpty)! || (firstName?.isEmpty)! || (lastName?.isEmpty)! || (country?.isEmpty)! || (dateOfBirth?.isEmpty)!){
            let alert = AlertViewController()
            alert.displayMyAlertMessage(userMessage: "Please, complete all field")
            
        }else{
            
            request.saveInfo(userEmail: userEmail!,firstName: firstName!,lastName: lastName!,dateOfBirth:dateOfBirth!, country:country!)
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        let alert = AlertViewController()
        alert.displayMyCancelMessage(userMessage: "You want cancel & exit de app?")

    }
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let colorTop = UIColor(red: 253.0 / 255.0, green: 252.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 226.0 / 255.0, green: 209.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop,colorBottom]
        view.backgroundColor = UIColor.clear
        gradientView.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func createDatePicker(){
        //formate picker
        datePicker.datePickerMode = .date
        
        //toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: false)
        dateOfBirthTextfield.inputAccessoryView = toolBar
        dateOfBirthTextfield.inputView = datePicker
    }
    
    func donePressed(){
        //Just to show date and not time
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateOfBirthTextfield.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }


    func configEventInfo(){
        nameEvent.text = "Name: \(event.name)"
        addressEvent.text = "Address: \(event.address)"
        let url = URL(string: event.bannerImage)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.bannerImageEvent.image = UIImage(data: data!)
            }
        }

    }
    func configEmailTextField(){
        // Set the array of strings you want to suggest
        emailTextfield.filterStrings(["gmail.com", "yahoo.com", "adidas.com", "hotmail.com", "outlook.com"])
        
        // Then set the inline mode in true
        emailTextfield.inlineMode = true
        
        // Start suggesting only after some string is detected
        emailTextfield.startFilteringAfter = "@"
        
        // Start suggesting inmediately just after the string is detected
        emailTextfield.startSuggestingInmediately = true

    }
    
    func configCountryField(){
        // Set the array of strings you want to suggest
        countryTextfield.filterStrings(["Madrid", "Barcelona", "Sevilla", "Valencia", "Zaragoza", "Las Palmas", "Alicante", "Albacete"])
        // Then set the inline mode in true
        countryTextfield.inlineMode = true
        
        
        // Start suggesting inmediately just after the string is detected
        countryTextfield.startSuggestingInmediately = true
        
    }
}

