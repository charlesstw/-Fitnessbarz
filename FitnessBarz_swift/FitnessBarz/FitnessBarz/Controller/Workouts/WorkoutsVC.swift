//
//  WorkoutsVC.swift
//  FitnessBarz
//
//  Created by Charles Wang on 2018/8/26.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class WorkoutsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mainTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.setUpDefaultVC(viewContrller: self)
        setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView() {
        mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.separatorColor = UIColor.clear
        self.view.addSubview(mainTableView)
        mainTableView.register(UINib(nibName: "WorkoutListCell", bundle: nil), forCellReuseIdentifier:"WorkoutListCell")
        }

    // MARK: Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:WorkoutListCell? = tableView.dequeueReusableCell(withIdentifier: "WorkoutListCell", for: indexPath) as? WorkoutListCell
        if (cell == nil) {
            cell = WorkoutListCell()
            
        }
        let userImage = UIImage(named:"fnbz_logo_80.jpeg")
        cell?.mainImage.image = userImage
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
