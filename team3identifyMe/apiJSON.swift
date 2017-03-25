//
//  apiJSON.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class clientAPI {
    private init() {}
    
    // MARK: Shared Instance
    static let sharedInstance: clientAPI = clientAPI()
    
    // MARK: Properities
    public var eventsData: JSON?
    
    func fetchEventsData() {
        // https://raw.githubusercontent.com/stor0095/identifyTeam3/master/api/events.json?token=ANnMX0zJyhgsPwF5lRcgWxO2cwjTopJAks5Y3w4AwA%3D%3D
        
        Alamofire.request("https://raw.githubusercontent.com/stor0095/identifyTeam3/master/api/events.json?token=ANnMX0zJyhgsPwF5lRcgWxO2cwjTopJAks5Y3w4AwA%3D%3D", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                // Pass in respective json into arrays depending on users language
                self.eventsData = json["Events"]
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
