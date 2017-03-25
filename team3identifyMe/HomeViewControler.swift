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
    let clientApiInstance = clientAPI.sharedInstance
    var refreshTimer: Timer!
    var eventNames = [String]()
    
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
        
        clientApiInstance.fetchEventsData()
        
        // Stop refreshing tableView when data is loaded
        refreshTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerToRefreshTableViewOnLoad), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.mainTableView.reloadData()
    }
    
    // MARK: Refresh tableView on pull
    func refreshTableView(_ refreshControl: UIRefreshControl) {
        self.mainTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    // MARK: Run a timer to check if the building list has been populated with data, if not, kepe refreshing.
    // Once data is recieved, stop the timer and populate the tableView.
    func timerToRefreshTableViewOnLoad() {
        let loadedJSON = self.clientApiInstance.eventsData?.arrayValue.count
        if loadedJSON == 35 {
            print("Refreshing")
            refreshTimer.invalidate()
            self.mainTableView.reloadData()
        }
        
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventsTableViewCell", for: indexPath) as! eventsTableViewCell
        DispatchQueue.main.async {
            let indexRowPath = indexPath.row
            let eventName = self.clientApiInstance.eventsData?.arrayValue.map({$0["name"].stringValue})
            let eventLocation = self.clientApiInstance.eventsData?.arrayValue.map({$0["location"].stringValue})
            let eventDate = self.clientApiInstance.eventsData?.arrayValue.map({$0["date"].stringValue})
            let eventTime = self.clientApiInstance.eventsData?.arrayValue.map({$0["time"].stringValue})
            let categoryID = self.clientApiInstance.eventsData?.arrayValue.map({$0["catid"].int})
            
            cell.eventNameLabel.text = eventName?[indexRowPath]
            cell.locationLabel.text = eventLocation?[indexRowPath]
            cell.dateLabel.text = eventDate?[indexRowPath]
            
            switch categoryID?[indexRowPath] {
            case 0?:
                cell.iconImage.image = #imageLiteral(resourceName: "Asset 948")
                cell.sideBarLabel.backgroundColor = UIColor.cyan
            case 1?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 348")
                cell.sideBarLabel.backgroundColor = UIColor.green
            case 2?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 148")
                cell.sideBarLabel.backgroundColor = UIColor.red
            case 3?:
                cell.iconImage.image = #imageLiteral(resourceName: "ic_rel")
                cell.sideBarLabel.backgroundColor = UIColor.yellow
            case 4?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 648")
                cell.sideBarLabel.backgroundColor = UIColor.orange
            case 5?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 548")
                cell.sideBarLabel.backgroundColor = UIColor.blue
            case 6?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 748")
                cell.sideBarLabel.backgroundColor = UIColor.purple
            default:
                break
            }
            
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventDetailSegue" {
            if let indexPath = self.mainTableView.indexPathForSelectedRow {
               let detailVC = segue.destination as! DetailEventViewController
                let eventName = self.clientApiInstance.eventsData?.arrayValue.map({$0["name"].stringValue})
                let eventLocation = self.clientApiInstance.eventsData?.arrayValue.map({$0["location"].stringValue})
                let eventDate = self.clientApiInstance.eventsData?.arrayValue.map({$0["date"].stringValue})
                let eventTime = self.clientApiInstance.eventsData?.arrayValue.map({$0["time"].stringValue})
                let eventDescription = self.clientApiInstance.eventsData?.arrayValue.map({$0["description"].stringValue})
                let categoryID = self.clientApiInstance.eventsData?.arrayValue.map({$0["catid"].int})
                
                detailVC.eventName = (eventName?[(indexPath as NSIndexPath).row])!
                detailVC.eventLocation = (eventLocation?[(indexPath as NSIndexPath).row])!
                detailVC.eventDate = (eventDate?[(indexPath as NSIndexPath).row])!
                detailVC.eventTime = (eventTime?[(indexPath as NSIndexPath).row])!
                detailVC.eventDescription = (eventDescription?[(indexPath as NSIndexPath).row])!
                
                switch (categoryID?[(indexPath as NSIndexPath).row])! {
                case 0:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "Asset 948")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.cyan
                case 1:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "icAsset 348")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.green
                case 2:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "icAsset 148")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.red
                case 3:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "ic_rel")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.yellow
                case 4:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "icAsset 648")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.orange
                case 5:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "icAsset 548")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.blue
                case 6:
                    detailVC.iconImageView.image = #imageLiteral(resourceName: "icAsset 748")
                    detailVC.cardViewForOpacity.backgroundColor = UIColor.purple
                default:
                    break
                }
            }
        }
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

