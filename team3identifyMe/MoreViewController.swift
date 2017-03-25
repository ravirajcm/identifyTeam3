//
//  MoreViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Report Issue"
        // Do any additional setup after loading the view.
        emailLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        //label.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
