//
//  ViewController.swift
//  BloodBankApp
//
//  Created by Nano Degree on 22/02/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class User{
    var name:String
    var password:String
    var isDonor : Bool
    var RH : Bool
    //var email :String
    
    init(name:String,password:String, isDonor:Bool, RH:Bool)
    {
        self.name=name
        self.password=password
        self.isDonor=isDonor
        self.RH=RH
        // self.email=email
        
    }
}



class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var donorBox: UIButton!
    
    @IBOutlet weak var acceptorBox: UIButton!
    
    @IBOutlet weak var donorLabel: UILabel!
    
    @IBOutlet weak var acceptorLabel: UILabel!
    var arrOfUsers = [User]()
    

    
    var boxOn = UIImage(named: "checked")
    var boxOff = UIImage(named: "notchecked")
    var isBoxChecked:Bool!
    
    
    
    //var details = [["firstNames":"Maham","lastNames" : "Akhter","passwords" : "1234","confirmPasswords" : "1234","emails" : "maham@yahoo.com","bloodGroups" : "B+","phoneNumbers" : "12345","image":"donor"],["firstNames" : "Huria","lastNames" : "Khan","passwords" : "1234","confirmPasswords" : "1234","emails" : "huria@yahoo.com","bloodGroups" : "A+","phoneNumbers" : "123456","image":"donor"],["firstNames" : "Quratulain","lastNames" : "ainy","passwords" : "1234","confirmPasswords" : "1234","emails" : "ainy@yahoo.com","bloodGroups" : "O+","phoneNumbers" : "1234567","image":"donor"],["firstNames" : "Abbad","lastNames" : "Kazmi","passwords" : "1234","confirmPasswords" : "1234","emails" : "abbad@yahoo.com","bloodGroups" : "O+","phoneNumbers" : "1234567","image":"donor"],["firstNames" : "Shahrukh","lastNames" : "Ali","passwords" : "1234","confirmPasswords" : "1234","emails" : "shahrukh@yahoo.com","bloodGroups" : "O+","phoneNumbers" : "1234567","image":"donor"],["firstNames" : "Sheema","lastNames" : "Faheem","passwords" : "1234","confirmPasswords" : "1234","emails" : "sheema@yahoo.com","bloodGroups" : "O+","phoneNumbers" : "1234567","image":"donor"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isBoxChecked = false
        
        
        let url = Bundle.main.path(forResource: "details", ofType: "json")
        
                /* Raw JSON data (...simliar to the format you might receive from the network) */
                let data = try! Data(contentsOf: URL(fileURLWithPath: url!))
        //print(rawUserJSON)
        
                /* Error object */
          //      let parsingUserError: NSError? = nil
        
        do{
            let parsedUserJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [Any]
            
//            print(parsedUserJSON)
            
            //let new = parsedUserJSON["details"] as! [Any]
            // print(new)
            for obj in parsedUserJSON{
                var item = obj as! [String:Any]
                let name = item["Name"] as! String
                let pass = item["Password"] as! String
                let email = item["Email"] as! String
                let isDonor = item["isDonor"] as! Bool
                let Rh = item["RH"] as! Bool
                let user = User(name: name, password: pass, isDonor: isDonor, RH: Rh)
                arrOfUsers.append(user)
            }
        }catch let err{
            print(err)
        }
                /* Parse the data into usable form */
       let use = [User]()
        let password = "1234"
        let loginUser = use.filter { (user) -> Bool in
            if user.password == password{
                return true
            }else{
                return false
            }
        }
        
        
        
        
//        let showUser = [User]()
//        if let curr = loginUser.first{
//            if curr.isDonor{
//                use.filter({ (user) -> Bool in
//                    user.isDonor == false {
        // if user.bg=="B" && user.rh==true{
        // if (user.bg=="B"|| user.bg=="AB")&& user.RH == true{
//                        return true
//                    }}else if .........{}
    //}
//                    else{
//                        return false
//                    }
//                })
//            }else{
//                
//            }
//        }
//        
        
        
         }
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signedIn(_ sender: AnyObject) {
        
        let email = emailField.text
        let password = passwordField.text
        
        for people in arrOfUsers{
            print(people.name,people.password)
            
        }
        var filteredpeople = [User]()
        for item in arrOfUsers{
            if item.name == email{
                if item.password == password{
                    displayMyAlert(myMsg: "Succesfull Login!")
                }
                
                
            }
            displayMyAlert(myMsg: "Incorrect Email or Password!")
        }
        
        
        
        let userEmail = UserDefaults.standard.string(forKey: "email")
        let userPassword = UserDefaults.standard.string(forKey: "password")
        if ((email?.isEmpty)! || (password?.isEmpty)!){
            
            displayMyAlert(myMsg: "All fields are required")
            
            return
        }
        
//        for item in details{
//            for dic in item.keys{
//                let v = item[dic]
//                if let value = v {
//                    if value != passwordField.text! {
//                        
//                        displayMyAlert(myMsg: "Passwords do not match")
//                        return;
//                    
//                    }
//                }
//            }
//        }
//        
//        if (userEmail == email){
//            if (userPassword == password){
//                if (donorBox.isEnabled){
//                UserDefaults.standard.set(Bool(), forKey: "isUserLoggedIn")
//                UserDefaults.standard.synchronize()
//                
//                self.dismiss(animated: true, completion: nil)
//                }else if (acceptorBox.isEnabled){
//                    UserDefaults.standard.set(Bool(), forKey: "isUserLoggedIn")
//                    UserDefaults.standard.synchronize()
//                    
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//        }
//        UserDefaults.standard.set(email,forKey:"email")
//        UserDefaults.standard.set(password,forKey:"password")
//        UserDefaults.standard.synchronize()
//        
       // self.performSegue(withIdentifier: "userScreen", sender: self.emailField.text)
        
    }
    
    func displayMyAlert(myMsg:String){
        
        let myAlert = UIAlertController(title: "Alert", message: myMsg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
        
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "userScreen"{
//            
//        let destVC = segue.destination as! DonorViewController
//            
//            for item in details{
//                for dic in item.keys{
//                    let v = item[dic]
//                    if let value = v {
//                        if value == emailField.text!{
//                            let name = item["firstNames"]
//                            let bg = item["bloodGroups"]
////                            let im = item["image"]
//                           destVC.userName = name!
//                            destVC.bloodGroup = bg!
//                            
//                        }
//                
//                    }
//                }
//            }
//        }
//    }
    @IBAction func donorButtonClicked(_ sender: AnyObject) {
        
        if isBoxChecked == true{
            isBoxChecked = false
        }else{
            isBoxChecked = true
        }
        if isBoxChecked == true{
            donorBox.setImage(boxOn, for: UIControlState.normal)
            acceptorBox.isHidden = true
            acceptorLabel.isHidden = true
        }else{
            donorBox.setImage(boxOff, for: UIControlState.normal)
            acceptorBox.isHidden = false
            acceptorLabel.isHidden = false
        }
        
    }
    @IBAction func acceptorButtonClicked(_ sender: AnyObject) {
        
        if isBoxChecked == true{
            isBoxChecked = false
        }else{
            isBoxChecked = true
        }
        if isBoxChecked == true{
            acceptorBox.setImage(boxOn, for: UIControlState.normal)
            donorBox.isHidden = true
            donorLabel.isHidden = true
        }else{
            acceptorBox.setImage(boxOff, for: UIControlState.normal)
            donorLabel.isHidden = false
            donorBox.isHidden = false
        }
        
    }
    
    
    
    
}
