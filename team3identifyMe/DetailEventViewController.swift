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
                self.cardView.backgroundColor = UIColor.cyan.withAlphaComponent(0.3)
            
            case 1:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 348")
                self.cardView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
            case 2:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 148")
                self.cardView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            case 3:
                self.iconImage.image = #imageLiteral(resourceName: "ic_rel")
                self.cardView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
            case 4:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 648")
                self.cardView.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
            case 5:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 548")
                self.cardView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
            case 6:
                self.iconImage.image = #imageLiteral(resourceName: "icAsset 748")
                self.cardView.backgroundColor = UIColor.purple.withAlphaComponent(0.3)
            default:
                break
            }
        }
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
