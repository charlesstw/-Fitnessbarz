//
//  ReadToStartVC.swift
//  FitnessBarz
//
//  Created by Charles on 2018/11/18.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class ReadyToStartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.register(UINib(nibName: "WorkoutListCell", bundle: nil), forCellReuseIdentifier:"WorkoutListCell")
        let header = InfoHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        self.mainTableView.tableHeaderView = header
        self.mainTableView.tableHeaderView?.layoutIfNeeded()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:WorkoutListCell? = tableView.dequeueReusableCell(withIdentifier: "WorkoutListCell", for: indexPath) as? WorkoutListCell
        if (cell == nil) {
            cell = WorkoutListCell()
            
        }
        let userImage = UIImage(named:"fnbz_logo_80.jpeg")
        cell?.mainImage.image = userImage
        return cell!
    }

}
