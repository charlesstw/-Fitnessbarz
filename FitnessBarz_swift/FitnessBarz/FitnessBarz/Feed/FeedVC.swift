//
//  FeedVC.swift
//  FitnessBarz
//
//  Created by Charles Wang on 2018/8/26.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var mainTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.setUpDefaultVC(viewContrller: self)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setUpTableView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpTableView() {
        mainTableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        mainTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier:"PostCell")
        

//        mainTableView.translatesAutoresizingMaskIntoConstraints = false
//        let views = ["view": view!, "mainTableView": mainTableView]
//        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-[mainTableView]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-[mainTableView]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views)
//        NSLayoutConstraint.activate(horizontalConstraints)
//        NSLayoutConstraint.activate(verticalConstraints)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)

       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
