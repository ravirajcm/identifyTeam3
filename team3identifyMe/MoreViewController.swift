//
//  MoreViewController.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit
import Foundation

class MoreViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    // IBOutlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var locationStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var descriptionTEXT: UITextView!


    @IBOutlet weak var descriptionStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Report Issue"
        // Do any additional setup after loading the view.
        //label.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "Send", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MoreViewController.SendMail))
        logButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = logButton
        self.emailTextField.delegate = self
        self.locationTextField.delegate = self
        self.descriptionTEXT.delegate = self;
        
        locationStackView.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        emailStackView.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        descriptionStackView.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.darkGray, thickness: 0.5)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SendMail() -> Void {
        
        
        
        var request = URLRequest(url: URL(string: "http://iamraviraj.com/awesomeemail/mail_handler.php")!)
        request.httpMethod = "POST"
        let tempString = locationTextField.text!+"&email="+emailTextField.text!+"&message="+descriptionTEXT.text!
        let postString = "first_name="+locationTextField.text!+"&last_name="+tempString
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            else
            {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Success",
                                                  message: "Email Sent Successfully!",
                                                  preferredStyle: UIAlertControllerStyle.alert)
                    
                    let addAction = UIAlertAction(title: "Okay",style:UIAlertActionStyle.default, handler: {(alert :UIAlertAction!) in
                        // handle your code here
                        
                    })
                    alert.addAction(addAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
        
       
    }
    
    // hides text views
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
   
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
