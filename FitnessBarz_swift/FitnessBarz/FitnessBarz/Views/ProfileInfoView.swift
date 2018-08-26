//
//  ProfileInfoView.swift
//  FitnessBarz
//
//  Created by Charles Wang on 2018/8/26.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class ProfileInfoView: UIView {
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    
    init(frame:CGRect,userImage:UIImage,userName:String) {
        super.init(frame: frame)
        profileImage = UIImageView(frame:CGRect(x:0,y:0,width:frame.height,height:frame.height))
        profileImage.layer.cornerRadius = frame.height/2
        profileImage.clipsToBounds = true
        let descHorizontal = String(format:"H:|-0-[profileImage(%d)]",frame.height)
        let descVertical = String(format:"V:|-0-[profileImage(%d)]",frame.height)
        self.addSubview(profileImage)
        
        let viewsDict = ["profileImage": profileImage,"nameLabel":nameLabel] as [String : Any]
        let horizotalContraint = NSLayoutConstraint.constraints(withVisualFormat: descHorizontal, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let verticalContraint = NSLayoutConstraint.constraints(withVisualFormat: descVertical, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        addConstraints(horizotalContraint)
        addConstraints(verticalContraint)
        
        
        
        
        nameLabel = UILabel(frame: CGRect(x:0,y:0,width:frame.width-profileImage.frame.width,height:frame.height))
        nameLabel.text = userName
        self.addSubview(nameLabel)
        
        
        let leading = NSLayoutConstraint(item: profileImage,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 0)
        let center = NSLayoutConstraint(item: profileImage,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0)
        self.addSubview(nameLabel)
        self.addConstraints([leading,center])

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
