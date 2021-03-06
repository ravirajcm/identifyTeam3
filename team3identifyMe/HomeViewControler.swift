//
//  FirstViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class HomeViewControler: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // MARK: Shared Instance
    static let sharedInstance: HomeViewControler = HomeViewControler()
    
    // MARK: Properities
    let clientApiInstance = clientAPI.sharedInstance
    var refreshTimer: Timer!
    var eventNames = [String]()
    var vc: ModalViewController? = nil
    var filteredCategory:NSMutableArray = []
    
    // IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var filterStackView: UIStackView!
    @IBOutlet weak var filteredImagesViewHolder: UIView!

    @IBAction func openFilter(_ sender: Any) {
        
        if self.vc == nil
        {
            self.vc = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController
            self.vc?.delegate = self
        }
        self.present(vc!, animated: true, completion: nil)
        

    }
    

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
    
    func filterData() -> Void {
        self.mainTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.mainTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let categoryID = self.clientApiInstance.eventsData?.arrayValue.map({$0["catid"].int})
        let tempCategoryId = categoryID?[indexPath.row]
        if self.filteredCategory.count>0 && !(self.filteredCategory as NSArray).contains(String(format:"%d",tempCategoryId!))
        {
            // Do something
            return 0

        }
        
        if self.filteredCategory.contains(String(describing: tempCategoryId))
        {
            return 0
        }
        
        return 145
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
                cell.sideBarLabel.backgroundColor = UIColor(red: 0, green: 0.7, blue: 0.7, alpha: 1.0) // UIColor.cyan
            case 1?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 348")
                cell.sideBarLabel.backgroundColor = UIColor(red: 3.0/255.0, green: 177.0/255, blue: 0.0/255, alpha: 1)
            case 2?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 148")
                cell.sideBarLabel.backgroundColor = UIColor(red: 239.0/255.0, green: 33/255, blue: 0.0/255, alpha: 1)
            case 3?:
                cell.iconImage.image = #imageLiteral(resourceName: "ic_rel")
                cell.sideBarLabel.backgroundColor = UIColor(red: 169.0/255.0, green: 185.0/255, blue: 0.0/255, alpha: 1)
            case 4?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 648")
                cell.sideBarLabel.backgroundColor = UIColor(red: 200.0/255.0, green: 145.0/255, blue: 0.0/255, alpha: 1)
            case 5?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 548")
                cell.sideBarLabel.backgroundColor = UIColor(red: 0.0/255.0, green: 1.0/255, blue: 193.0/255, alpha: 1)
            case 6?:
                cell.iconImage.image = #imageLiteral(resourceName: "icAsset 748")
                cell.sideBarLabel.backgroundColor = UIColor(red: 149.0/255.0, green: 0.0/255, blue: 193.0/255, alpha: 1)
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
                detailVC.categoryId = (categoryID?[(indexPath as NSIndexPath).row])!
                
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

