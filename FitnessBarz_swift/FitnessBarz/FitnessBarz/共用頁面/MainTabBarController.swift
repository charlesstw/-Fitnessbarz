//
//  MainTabBarController.swift
//  FitnessBarz
//
//  Created by Charles Wang on 2018/8/26.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let feedVC = RootNavigationController.init(rootViewController: FeedVC())
    let workoutsVC = RootNavigationController.init(rootViewController: WorkoutsVC())
    let profileVC = RootNavigationController.init(rootViewController: ProfileVC())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "fnbz_logo_40.jpeg")
        feedVC.tabBarItem = UITabBarItem(title: "Post", image: image?.withRenderingMode(.alwaysOriginal), tag: 0)
        workoutsVC.tabBarItem = UITabBarItem(title: "Workout", image: UIImage.init(named: "fnbz_logo_40"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(named: "fnbz_logo_40"), tag: 2)
        let tabBarList = [feedVC,workoutsVC,profileVC]
        self.viewControllers = tabBarList
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
