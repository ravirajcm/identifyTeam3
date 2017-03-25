//
//  eventsTableViewCell.swift
//  team3identifyMe
//
//  Created by Geemakun Storey on 2017-03-24.
//  Copyright © 2017 geemakunstorey@storeyofgee.com. All rights reserved.
//

import UIKit

class eventsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventsCell: UIView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var sideBarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI() {
        backGroundView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        backGroundView.layer.cornerRadius = 3.0
        backGroundView.layer.masksToBounds = false
        backGroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backGroundView.layer.shadowOpacity = 0.8
    }
    
//    func drawLine() {
//        let lineView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(25), width: CGFloat(self.contentView.bounds.size.width), height: CGFloat(1)))
//        lineView.backgroundColor = UIColor.black
//        lineView.autoresizingMask = UIViewAutoresizing(rawValue: 0x3f)
//        self.contentView.addSubview(lineView)
//
//    }
    
//    override func draw(_ rect: CGRect) {
//        let aPath = UIBezierPath()
//        
//        aPath.move(to: CGPoint(x:20, y:50))
//        
//        aPath.addLine(to: CGPoint(x:300, y:50))
//        
//        //Keep using the method addLineToPoint until you get to the one where about to close the path
//        
//        aPath.close()
//        
//        //If you want to stroke it with a red color
//        UIColor.red.set()
//        aPath.stroke()
//        //If you want to fill it as well
//        aPath.fill()
//    }

}
