//
//  SecondViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit
import ALAccordion

class ServicesViewController: ALAccordionController {

    
    // IBOutlets
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Services"
        
      //  self.createHeaderFooterViews()
        self.createSections()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    func createSections() {
        // Create some sample sections
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let section1ViewController = storyboard.instantiateViewController(withIdentifier: "firstVC") as! LGBTQ
        let section2ViewController = storyboard.instantiateViewController(withIdentifier: "secondVC") as! Aborginal
        let section3ViewController = storyboard.instantiateViewController(withIdentifier: "thirdVC") as! Religous
        let section4ViewController = storyboard.instantiateViewController(withIdentifier: "fourthVC") as! Addiction
        let section5ViewController = storyboard.instantiateViewController(withIdentifier: "fifthVC") as! International
        let section6ViewController = storyboard.instantiateViewController(withIdentifier: "sixthVC") as! SexualAssault
        
        self.setViewControllers(section1ViewController, section2ViewController, section3ViewController, section4ViewController, section5ViewController, section6ViewController)
    }
}

