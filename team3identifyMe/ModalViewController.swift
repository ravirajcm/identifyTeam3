//
//  ModalViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: Properities
    var tapGesuture: UITapGestureRecognizer!
    
    // IBOutlets
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var backGroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tapGesuture = UITapGestureRecognizer(target: self, action: #selector(dismissSelector))
        tapGesuture.delegate = self
        tapGesuture.numberOfTapsRequired = 1
        tapGesuture.cancelsTouchesInView = false
        self.backGroundView.addGestureRecognizer(tapGesuture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissSelector() {
        print("Dismissed")
        self.dismiss(animated: true, completion: nil)
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
