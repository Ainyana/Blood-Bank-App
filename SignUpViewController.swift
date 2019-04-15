//
//  SignUpViewController.swift
//  BloodBankApp
//
//  Created by Nano Degree on 22/02/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {

    @IBOutlet weak var userBloodGroup: UILabel!
    
    @IBOutlet weak var bloodGroups: UIPickerView!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var groupField: UILabel!
    
    var groups = ["Default","A+","A-","B+","B-","AB+","AB-","O+","O-"]
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groups[row]
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groups.count
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userBloodGroup.text = groups[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userSignedUp(_ sender: AnyObject) {
        
        let firstName = firstNameField.text
        let lastName = lastNameField.text
        let password = passwordField.text
        let confirmPassword = confirmPasswordField.text
        let email = emailField.text
        let phone = phoneField.text
        let group = groupField.text
        
        if ((firstName?.isEmpty)! || (lastName?.isEmpty)! || (password?.isEmpty)! || (confirmPassword?.isEmpty)! || (email?.isEmpty)! || (phone?.isEmpty)! || group == "Default"){
            
            displayMyAlert(myMsg: "All fields are required")
            
            return;
        }
        
        if (password != confirmPassword){
            
            displayMyAlert(myMsg: "Passwords do not match")
            
            return;
        }
        UserDefaults.standard.set(email,forKey:"email")
        UserDefaults.standard.set(password,forKey:"password")
        UserDefaults.standard.synchronize()
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is confirmed.. Thank you :)", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true,completion: nil)
            }
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
        
        
    }
    
    func displayMyAlert(myMsg:String){
        
        let myAlert = UIAlertController(title: "Alert", message: myMsg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
