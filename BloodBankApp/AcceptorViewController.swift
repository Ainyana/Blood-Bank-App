//
//  AcceptorViewController.swift
//  BloodBankApp
//
//  Created by Nano Degree on 24/02/2018.
//  Copyright © 2018 Nano Degree. All rights reserved.
//

import UIKit

class AcceptorViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!

    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var acceptorCollectionView: UICollectionView!
    
    struct acceptBlood {
        var otherUserName:String
        var otherBloodGroup:String
        var otherPhone:String
        var otherImage:UIImage
    }
    
    var acceptorsArray:[acceptBlood] = []
    
    var userName = String()
    var bloodGroup = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameLabel.text = userName
        self.bloodGroupLabel.text = bloodGroup
        
        
        acceptorsArray.append(acceptBlood(otherUserName: "Sami", otherBloodGroup: "B+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        acceptorsArray.append(acceptBlood(otherUserName: "Ebbad", otherBloodGroup: "O+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        acceptorsArray.append(acceptBlood(otherUserName: "Faiza", otherBloodGroup: "A+", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        acceptorsArray.append(acceptBlood(otherUserName: "Maharukh", otherBloodGroup: "B-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))
        acceptorsArray.append(acceptBlood(otherUserName: "Nimra", otherBloodGroup: "AB-", otherPhone: "123456", otherImage: UIImage(named:"donate")!))

        acceptorCollectionView.delegate = self
        acceptorCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return acceptorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"acceptorCell", for: indexPath) as! AcceptorCollectionViewCell
        cell.userNameLabel.text = acceptorsArray[indexPath.item].otherUserName
        cell.bloodGroupLabel.text = acceptorsArray[indexPath.item].otherBloodGroup
        cell.phoneLabel.text = acceptorsArray[indexPath.item].otherPhone
        cell.imageLabel.image = acceptorsArray[indexPath.item].otherImage
        return cell
    }
    
    @IBAction func didUnwindSeguePerform(_ sender: AnyObject) {
        
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
