//
//  FirstViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class HomeViewControler: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properities
    
    // IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var filterStackView: UIStackView!
    @IBOutlet weak var filteredImagesViewHolder: UIView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Tab View Controller Layout
        let numberOfItems = CGFloat((tabBarController?.tabBar.items!.count)!)
        let tabBarItemSize = CGSize(width: (tabBarController?.tabBar.frame.width)! / numberOfItems,
                                    height: (tabBarController?.tabBar.frame.height)!)
        tabBarController?.tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.white, size: tabBarItemSize).resizableImage(withCapInsets: .zero)
        tabBarController?.tabBar.frame.size.width = self.view.frame.width + 4
        tabBarController?.tabBar.frame.origin.x = -2
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.white
        ///////////////// End of Tab View Controller Layout
        
        self.title = "Events"
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 76
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventsTableViewCell", for: indexPath) as! eventsTableViewCell
        
        //let indexRowPath = indexPath.row

        return cell
    }
}

// MARK: Extenstion of UIImage
extension UIImage
{
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

