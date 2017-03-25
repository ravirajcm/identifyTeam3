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

     var objects: NSArray = []; //variable to hold Array
    @IBOutlet weak var loader: UIActivityIndicatorView!
    // IBOutlets
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Services"
        
      //  self.createHeaderFooterViews()
        self.loader.isHidden = false
        self.loader.startAnimating()
        self.fetchData()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    func createSections() {
        // Create some sample sections
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let section1ViewController = storyboard.instantiateViewController(withIdentifier: "firstVC") as! LGBTQ
        section1ViewController.dataobject = self.objects[1] as! NSDictionary

        let section2ViewController = storyboard.instantiateViewController(withIdentifier: "secondVC") as! Aborginal
        section2ViewController.dataobject = self.objects[2] as! NSDictionary

        let section3ViewController = storyboard.instantiateViewController(withIdentifier: "thirdVC") as! Religous
        section3ViewController.dataobject = self.objects[3] as! NSDictionary

        let section4ViewController = storyboard.instantiateViewController(withIdentifier: "fourthVC") as! Addiction
        section4ViewController.dataobject = self.objects[4] as! NSDictionary

        let section5ViewController = storyboard.instantiateViewController(withIdentifier: "fifthVC") as! International
        section5ViewController.dataobject = self.objects[5] as! NSDictionary

        let section6ViewController = storyboard.instantiateViewController(withIdentifier: "sixthVC") as! SexualAssault
        section6ViewController.dataobject = self.objects[6] as! NSDictionary

        
        let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)

        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            //Your code to run after 20 seconds
             self.setViewControllers(section1ViewController, section2ViewController, section3ViewController, section4ViewController, section5ViewController, section6ViewController)
            self.loader.isHidden = true
            self.loader.stopAnimating()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    func fetchData() {
        //Preparing Header for Authorization
      
        let headers = [
            "cache-control": "no-cache",
            ]
        // Create the request object and pass in your url
        let request = NSMutableURLRequest(url: NSURL(string: "https://raw.githubusercontent.com/stor0095/identifyTeam3/master/api/services.json?token=ABkzu2m7-wuqC0tYvcIuk-Dk9or8lLPsks5Y3zFSwA%3D%3D")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        // Create the URLSession object that will make the request
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                // println(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode == 200
                {
                    //All good parse data full dictonary
                    let dictData = (try! JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)) as! NSDictionary
                    
                    //Taking reference of array to local object
                    self.objects = (dictData["categories"] as? NSArray)!
                    self.createSections()

                    print("Could not get todo title from JSON")
//                    self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: true)
                }
            }
        })
        // Tell the task to run
        dataTask.resume()
    }

}

