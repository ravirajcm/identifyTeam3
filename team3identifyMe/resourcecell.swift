//
//  resourcecell.swift
//  team3identifyMe
//
//  Created by Raviraj Mangukiya on 2017-03-25.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class resourcecell: UITableViewCell {

    @IBOutlet weak var lblResourceTitle: UILabel!
    @IBOutlet weak var lblResourceDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
