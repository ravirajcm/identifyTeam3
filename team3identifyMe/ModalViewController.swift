//
//  ModalViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit
import SwiftyJSON

class ModalViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: Properities
    var tapGesuture: UITapGestureRecognizer!
    let clientApiInstance = clientAPI.sharedInstance
    
    // IBOutlets
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var generalSwitchOutlet: UISwitch!
    @IBOutlet weak var lgbqtOutlet: UISwitch!
    @IBOutlet weak var internationSwitchOutlet: UISwitch!
    @IBOutlet weak var aborginalSwitchOutlet: UISwitch!
    @IBOutlet weak var addictionSwitchOutlet: UISwitch!
    var delegate:HomeViewControler? = nil
    
    var arrayOfLabels = [UILabel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalView.layer.cornerRadius = 12.5
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        addUnderline()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tapGesuture = UITapGestureRecognizer(target: self, action: #selector(dismissSelector))
        tapGesuture.delegate = self
        tapGesuture.numberOfTapsRequired = 1
        tapGesuture.cancelsTouchesInView = false
        self.backGroundView.addGestureRecognizer(tapGesuture)
    }
    
    func dismissSelector() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        delegate?.filterData()
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var religousSwitchAction: UISwitch!
    
    
    
    // MARK: Switches
    @IBAction func aborginalSwitchAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("2"))! {
            delegate?.filteredCategory.remove("2")
        } else {
            delegate?.filteredCategory.add("2")
        }
    }
    
    @IBAction func lgbqtSwitchActionAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("1"))! {
            delegate?.filteredCategory.remove("1")
        } else {
            delegate?.filteredCategory.add("1")
        }
    }
    
    @IBAction func religousSwitchButton(_ sender: Any) {
        if (delegate?.filteredCategory.contains("3"))! {
            delegate?.filteredCategory.remove("3")
        } else {
            delegate?.filteredCategory.add("3")
        }
    }
    
    @IBAction func internationalSwitchAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("5"))! {
            delegate?.filteredCategory.remove("5")
        } else {
            delegate?.filteredCategory.add("5")
        }
    }
    @IBAction func addictionSwitchAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("4"))! {
            delegate?.filteredCategory.remove("4")
        } else {
            delegate?.filteredCategory.add("4")
        }
    }
    
    @IBAction func sexualAbuseSwitchAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("6"))! {
            delegate?.filteredCategory.remove("6")
        } else {
            delegate?.filteredCategory.add("6")
        }
    }
    
    @IBAction func generalSwitchAction(_ sender: Any) {
        if (delegate?.filteredCategory.contains("0"))! {
            delegate?.filteredCategory.remove("0")
        } else {
            delegate?.filteredCategory.add("0")
        }
    }
    
    
    
    func addUnderline() {
        arrayOfLabels.append(labelOne)
        arrayOfLabels.append(labelTwo)
        arrayOfLabels.append(labelThree)
        arrayOfLabels.append(labelFour)
        arrayOfLabels.append(labelFive)
        arrayOfLabels.append(labelSix)
        arrayOfLabels.append(labelSeven)
        
        for label in arrayOfLabels {
            label.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        }
    }
    
    
    
    
    
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
