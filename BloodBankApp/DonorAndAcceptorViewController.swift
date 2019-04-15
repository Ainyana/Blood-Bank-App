//
//  DonorAndAcceptorViewController.swift
//  BloodBankApp
//
//  Created by Nano Degree on 03/03/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class DonorAndAcceptorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func logout(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC") as! ViewController
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.rootViewController = loginVC
    }
  

}
