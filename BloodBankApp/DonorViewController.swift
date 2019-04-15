//
//  DonorViewController.swift
//  BloodBankApp
//
//  Created by Nano Degree on 24/02/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class DonorViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var bloodGroupField: UILabel!
    
    @IBOutlet weak var userImageField: UIImageView!
    
    @IBOutlet weak var donorCollectionView: UICollectionView!
    
    struct donateBlood {
        var otherUserName:String
        var otherBloodGroup:String
        var otherPhone:String
        var otherImage:UIImage
    }
    
    var donationArray:[donateBlood] = []
    
    var userName = String()
    var bloodGroup = String()
    var userImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameField.text = userName
        self.bloodGroupField.text = bloodGroup
        self.userImageField.image = userImage
        
        if bloodGroupField.text == "O+"{
        
        donationArray.append(donateBlood(otherUserName: "Nifra", otherBloodGroup: "AB+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Hira", otherBloodGroup: "A-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Maha", otherBloodGroup: "O+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Aisha", otherBloodGroup: "B+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Safia", otherBloodGroup: "A+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Fizza", otherBloodGroup: "AB-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Ahmed", otherBloodGroup: "B-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Iqra", otherBloodGroup: "O-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        donationArray.append(donateBlood(otherUserName: "Hina", otherBloodGroup: "O+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        }else if bloodGroupField.text == "A+"{
            donationArray.append(donateBlood(otherUserName: "Nifra", otherBloodGroup: "AB+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Hira", otherBloodGroup: "A-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Safia", otherBloodGroup: "A+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            
        }else if bloodGroupField.text == "B+"{
            donationArray.append(donateBlood(otherUserName: "Nifra", otherBloodGroup: "AB+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Aisha", otherBloodGroup: "B+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Fizza", otherBloodGroup: "AB-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Ahmed", otherBloodGroup: "B-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            
        }else if bloodGroupField.text == "AB+"{
            donationArray.append(donateBlood(otherUserName: "Nifra", otherBloodGroup: "AB+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            donationArray.append(donateBlood(otherUserName: "Fizza", otherBloodGroup: "AB-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
            
        }
        
        
        donorCollectionView.delegate = self
        donorCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return donationArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"donorCell", for: indexPath) as! DonorCollectionViewCell
        cell.userNameLabel.text = donationArray[indexPath.item].otherUserName
        cell.bloodGroupLabel.text = donationArray[indexPath.item].otherBloodGroup
        cell.phoneLabel.text = donationArray[indexPath.item].otherPhone
        cell.imageLabel.image = donationArray[indexPath.item].otherImage
        return cell
    }



    @IBAction func logInAsAcceptor(_ sender: AnyObject) {
        //self.performSegue(withIdentifier: "userAcceptor",sender: self.userNameField.text)
//        self.performSegue(withIdentifier: "userAcceptor", sender: self.bloodGroupField.text)
  //      self.performSegue(withIdentifier: "userAcceptor", sender: self.userImageField.image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userAcceptor"{
            
            let destVC = segue.destination as! AcceptorViewController
            
            destVC.userName = userName
            destVC.bloodGroup = bloodGroup
            
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
}
