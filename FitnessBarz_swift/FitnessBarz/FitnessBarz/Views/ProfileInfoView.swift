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
    
    func setUser(userImage:UIImage,userName:String){
        //super.init(frame: frame)
        profileImage.image = userImage
        nameLabel.text = userName
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let frame = self.frame;
        profileImage = UIImageView(frame:CGRect(x:0,y:0,width:frame.height,height:frame.height))
        profileImage.layer.cornerRadius = frame.height/2
        profileImage.clipsToBounds = true
        self.addSubview(profileImage)
        nameLabel = UILabel(frame: CGRect(x:profileImage.frame.width,y:0,width:frame.width-profileImage.frame.width,height:frame.height))
        self.addSubview(nameLabel)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let height = frame.height
        let viewsDict = ["profileImage": profileImage,"nameLabel":nameLabel] as [String : Any]
        let descHorizontal = String(format:"H:|-0-[profileImage(%f)]",height)
        let descVertical = String(format:"V:|-0-[profileImage(%f)]",height)
        let descHorizontalName = String(format:"H:[profileImage]-5-[nameLabel]-|");
        let descVerticalName = String(format:"V:|-0-[nameLabel(%f)]",height)
        
        let visualFormatArray = [descHorizontal,descVertical,descHorizontalName,descVerticalName]
        for visualFormat in visualFormatArray {
            let contraint = NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
            addConstraints(contraint)
        }
//        let horizotalContraint = NSLayoutConstraint.constraints(withVisualFormat: descHorizontal, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
//        let verticalContraint = NSLayoutConstraint.constraints(withVisualFormat: descVertical, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
//        addConstraints(horizotalContraint)
//        addConstraints(verticalContraint)
        
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
        self.addConstraints([leading,center])
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
