//
//  ALSingleLineHeaderView.swift
//  ALAccordion Example
//
//  Created by Sam Williams on 18/04/2015.
//  Copyright (c) 2015 Alliants Ltd. All rights reserved.
//
//  http://alliants.com
//

import UIKit

class ALSingleLineHeaderView: UIView
{
    //
    // MARK: - Properties
    //

    let topSeparator: ALSeparatorView =
    {
        let view = ALSeparatorView()
        view.separatorColor = UIColor.darkGray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bottomSeparator: ALSeparatorView =
    {
        let view = ALSeparatorView()
        view.separatorColor = UIColor.darkGray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel =
    {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textColor = UIColor.purple
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    

    
    let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "icAsset 148")
       // image.frame = CGRect(x: 0, y: 0, width: 5.0, height: 5.0)
        image.contentMode = UIViewContentMode.scaleAspectFit;
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //
    // MARK: - Initialisers
    //
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)

        self.commonInit()
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()

        self.commonInit()
    }

    func commonInit()
    {
        // Create and setup views
        self.addSubview(self.topSeparator)
        self.addSubview(self.titleLabel)
        self.addSubview(self.iconImage)
        self.addSubview(self.bottomSeparator)

        // Setup constraints
        let views = ["topSeparator": self.topSeparator, "titleLabel": self.titleLabel, "iconImage": self.iconImage,"bottomSeparator": self.bottomSeparator]

        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|[topSeparator(1)]-(15)-[titleLabel]-(15)-[bottomSeparator(1)]|", options: [], metrics: nil, views: views)
        //let verticalImage = NSLayoutConstraint.constraints(withVisualFormat: "V:|[topSeparator(1)]-(15)-[iconImage]-(15)-[bottomSeparator(1)]|", options: [], metrics: nil, views: views)

        let horizontal_topSeparator = NSLayoutConstraint.constraints(withVisualFormat: "H:|[topSeparator]|", options: [], metrics: nil, views: views)
        let horizontal_image = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[iconImage]-15-|", options: [], metrics: nil, views: views)
        let horizontal_titleLabel      = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[titleLabel]-15-|", options: [], metrics: nil, views: views)
        let horizontal_bottomSeparator = NSLayoutConstraint.constraints(withVisualFormat: "H:|[bottomSeparator]|", options: [], metrics: nil, views: views)

        self.addConstraints(vertical + horizontal_topSeparator + horizontal_image + horizontal_titleLabel + horizontal_bottomSeparator)
    }
}

extension UIImage {
    
    func imageResize (sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }

    
}
