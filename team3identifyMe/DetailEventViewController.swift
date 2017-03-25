//
//  DetailEventViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventDescriptionTextField: UITextView!
    @IBOutlet weak var cardViewForOpacity: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    // MARK: Properities
    var eventName = String()
    var eventDate = String()
    var eventTime = String()
    var eventLocation = String()
    var categoryId = Int()
    var eventDescription = String()
    var eventIcon = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpView()
    }
    
    func setUpView() {
        DispatchQueue.main.async {
            self.eventNameLabel.text = self.eventName
            self.eventDateLabel.text = self.eventDate
            self.eventDescriptionTextField.text = self.eventDescription
            
            
            switch (self.categoryId) {
                
            case 0:
                self.iconImage.image = #imageLiteral(resourceName: "Asset 948")
                self.cardView.backgroundColor = UIColor(red: 0, green: 0.7, blue: 0.7, alpha: 0.1)
            
            case 1:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 348")
                self.cardView.backgroundColor = UIColor(red: 3.0/255.0, green: 177.0/255, blue: 0.0/255, alpha: 0.1)
            case 2:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 148")
                self.cardView.backgroundColor = UIColor(red: 239.0/255.0, green: 33/255, blue: 0.0/255, alpha: 0.1)
            case 3:
                self.iconImage.image = #imageLiteral(resourceName: "ic_rel")
                self.cardView.backgroundColor = UIColor(red: 169.0/255.0, green: 185.0/255, blue: 0.0/255, alpha: 0.1)
            case 4:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 648")
                self.cardView.backgroundColor = UIColor(red: 200.0/255.0, green: 145.0/255, blue: 0.0/255, alpha: 0.1)
            case 5:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 548")
                self.cardView.backgroundColor = UIColor(red: 0.0/255.0, green: 1.0/255, blue: 193.0/255, alpha: 0.1)
            case 6:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 748")
                self.cardView.backgroundColor = UIColor(red: 149.0/255.0, green: 0.0/255, blue: 193.0/255, alpha: 0.1)
            default:
                break
            }
        }
    }
    
    
    @IBAction func shareActionButton(_ sender: UIButton) {
        print("Tapped")
//        let textToShare = eventName
        let eventDateShare = eventDate
        let eventDescriptionShare = eventDescription
//        if let myWebsite = self.iconImage {
//            let objectsToShare = [textToShare, eventDate, eventDescriptionShare, myWebsite] as [Any]
//    }
        
        
           let myWebsite = eventName //Enter link to your app here
            let objectsToShare = [myWebsite, eventDescriptionShare, eventDate, #imageLiteral(resourceName: "icAsset 148") ?? #imageLiteral(resourceName: "Asset 948")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        

    }

}
