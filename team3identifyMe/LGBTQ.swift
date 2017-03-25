//
//  LGBTQ.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit
import ALAccordion

//extension String {
//    func htmlAttributedString() -> NSAttributedString? {
//        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
//        guard let html = try? NSMutableAttributedString(
//            data: data,
//            options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//            documentAttributes: nil) else { return nil }
//        return html
//    }
//}


class LGBTQ: UIViewController, ALAccordionSectionDelegate , UITableViewDelegate, UITableViewDataSource {

    var dataobject: NSDictionary = [:]

    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!

    let animals: [String] = ["1", "2", "3", "4", "5","6","7","8","9"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataobject.value(forKey: "name") as! String?
        
        
        // Add gesture recognizer to header
        self.headerView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:))))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0)
        {
            return ""
        }
        else if(section==1)
        {
            return "Hours of Operation"
        }
        else if(section==2)
        {
            return "Contact Person"
        }
        else if(section==3)
        {
            if ((dataobject.value(forKey: "name") as! String) != "General")
            {
                return ""
            }
            return "Resources"
        }
        else if(section==4)
        {
            return "Activities"
        }


        
        return "temp"
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section==0)
        {
            return 1
        }
        else if(section==1)
        {
            let tempArray: NSArray = (dataobject.value(forKey: "building") as! NSArray?)!
            let hoursofoperationarray: NSArray = tempArray.value(forKey: "hoursofoperation") as! NSArray
            return (hoursofoperationarray[0] as AnyObject).count
        }
        else if(section==2)
        {
            let tempArray: NSArray = (dataobject.value(forKey: "building") as! NSArray?)!
            let staffarray: NSArray = tempArray.value(forKey: "staff") as! NSArray
            return (staffarray[0] as AnyObject).count
        }
        else if(section==3)
        {
            if ((dataobject.value(forKey: "name") as! String) != "General")
            {
                return 0
            }
            let tempArray: NSArray = (dataobject.value(forKey: "resources") as! NSArray?)!
            return tempArray.count
        }
        else if(section==4)
        {
            let tempArray: NSArray = (dataobject.value(forKey: "overview") as! NSArray?)!
            return tempArray.count
        }

        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 80

        return UITableViewAutomaticDimension

    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        let tempArray: NSArray = (dataobject.value(forKey: "building") as! NSArray?)!
        let hoursofoperationarray: NSArray = tempArray.value(forKey: "hoursofoperation") as! NSArray
        let staffarray: NSArray = tempArray.value(forKey: "staff") as! NSArray

        if indexPath.section == 0
        {
            cell.textLabel?.text = dataobject.value(forKey: "description") as! String?
             cell.textLabel?.numberOfLines = 0
             cell.textLabel?.sizeToFit()
            cell.selectionStyle = UITableViewCellSelectionStyle.none


        }
        else if indexPath.section == 1
        {
            let operationcell = tableView.dequeueReusableCell(withIdentifier: "operationhourscell", for: indexPath) as! operationhourscell
            let fullNameArr = ((hoursofoperationarray[0] as AnyObject).objectAt(indexPath.row) as? String)?.characters.split{$0 == ":"}.map(String.init)
            operationcell.lblOperationTitle.text = fullNameArr?[0]
            operationcell.lblOperationTime.text = ((hoursofoperationarray[0] as AnyObject).objectAt(indexPath.row) as? String)?.replacingOccurrences(of: ((fullNameArr?[0])! + ":") , with: "")
            operationcell.selectionStyle = UITableViewCellSelectionStyle.none

            return operationcell

        }
        else if indexPath.section == 2
        {
            let contactcell = tableView.dequeueReusableCell(withIdentifier: "contactpersoncell", for: indexPath) as! contactpersoncell
            contactcell.lblContactName.text = (staffarray[0] as AnyObject).objectAt(indexPath.row).value(forKey: "name") as? String
            contactcell.lblContactAddress.text = (staffarray[0] as AnyObject).objectAt(indexPath.row).value(forKey: "designation") as? String
            contactcell.lblContactPhone.text = (staffarray[0] as AnyObject).objectAt(indexPath.row).value(forKey: "phone") as? String
            contactcell.selectionStyle = UITableViewCellSelectionStyle.none
            return contactcell
          //  cell.textLabel?.text = (staffarray[0] as AnyObject).objectAt(indexPath.row).value(forKey: "name") as? String

        }
        else if indexPath.section == 3
        {
            let resourceCell = tableView.dequeueReusableCell(withIdentifier: "resourcecell", for: indexPath) as! resourcecell
            resourceCell.lblResourceTitle.text = (((dataobject.value(forKey: "resources") as AnyObject).objectAt(indexPath.row).value(forKey: "title")) as! NSString) as String
            
            resourceCell.lblResourceDescription.attributedText = ((((dataobject.value(forKey: "resources") as AnyObject).objectAt(indexPath.row).value(forKey: "description")) as! NSString) as String).htmlAttributedString()

            
           // resourceCell.lblResourceDescription.text = (((dataobject.value(forKey: "resources") as AnyObject).objectAt(indexPath.row).value(forKey: "description")) as! NSString) as String
            resourceCell.lblResourceDescription.sizeToFit()
            resourceCell.lblResourceTitle.sizeToFit()
resourceCell.selectionStyle = UITableViewCellSelectionStyle.none
            return resourceCell

        }
        else if indexPath.section == 4
        {
            
            let resourceCell = tableView.dequeueReusableCell(withIdentifier: "resourcecell", for: indexPath) as! resourcecell
            resourceCell.lblResourceTitle.text = (((dataobject.value(forKey: "overview") as AnyObject).objectAt(indexPath.row).value(forKey: "title")) as! NSString) as String
            
            let activityArray:NSArray = (((dataobject.value(forKey: "overview") as AnyObject).objectAt(indexPath.row) as AnyObject).value(forKey: "activities")) as! NSArray
            
            
            resourceCell.lblResourceDescription.attributedText = (activityArray.componentsJoined(by: "\n*")).htmlAttributedString()
            
            
            // resourceCell.lblResourceDescription.text = (((dataobject.value(forKey: "resources") as AnyObject).objectAt(indexPath.row).value(forKey: "description")) as! NSString) as String
            resourceCell.lblResourceDescription.sizeToFit()
            resourceCell.lblResourceTitle.sizeToFit()
            resourceCell.selectionStyle = UITableViewCellSelectionStyle.none
            return resourceCell

            //cell.textLabel?.text = self.animals[indexPath.row]
            
        }
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    //
    // MARK: - ALAccordionControllerDelegate
    //
    
    // The header view for this section
    var headerView: UIView =
        {
            let header = ALSingleLineHeaderView()
            header.titleLabel.text = "LGBTQ"
            
            return header
    }()
    
    func sectionWillOpen(animated: Bool)
    {
        print("First Section Will Open")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 0
        },
                       completion: nil)
    }
    
    func sectionWillClose(animated: Bool)
    {
        print("First Section Will Close")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 1.0
        },
                       completion: nil)
    }
    
    func sectionDidOpen()
    {
        print("First Section Did Open")
    }
    
    func sectionDidClose()
    {
        print("First Section Did Close")
    }
    
    //
    // MARK: - Gesture Recognizer
    //
    
    func headerTapped(_ recognizer: UITapGestureRecognizer)
    {
        // Get the section index for this view controller
        if let sectionIndex = self.accordionController?.sectionIndexForViewController(self)
        {
            print("First view controller header tapped")
            
            // If this section is open, close it - otherwise, open it
            if self.accordionController!.openSectionIndex == sectionIndex
            {
                self.accordionController?.closeSectionAtIndex(sectionIndex, animated: true)
            }
            else
            {
                self.accordionController?.openSectionAtIndex(sectionIndex, animated: true)
            }
        }
    }
    
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        // Get the section for this view controller
        if let sectionIndex = self.accordionController?.sectionIndexForViewController(self)
        {
            self.accordionController?.closeSectionAtIndex(sectionIndex, animated: true)
        }
    }
    

}
