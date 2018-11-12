//
//  WorkoutListCell.swift
//  FitnessBarz
//
//  Created by Charles on 2018/11/11.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class WorkoutListCell: UITableViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
