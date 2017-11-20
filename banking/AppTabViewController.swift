//
//  AppTabViewController.swift
//  banking
//
//  Created by Hong Gao on 2017/11/18.
//  Copyright © 2017年 Hong Gao. All rights reserved.
//

import UIKit

class AppTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let accountsController = storyboard.instantiateViewController(withIdentifier: "AccountNavigation")
        let accountItem = UITabBarItem(title: "Account", image: nil, tag: 0)
        accountsController.tabBarItem = accountItem
        let depositController = storyboard.instantiateViewController(withIdentifier: "DepositsViewController")
        let depositItem = UITabBarItem(title: "Deposit", image: nil, tag: 1)
        depositController.tabBarItem = depositItem
        self.viewControllers = [accountsController, depositController]
    }

}
