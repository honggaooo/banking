//
//  AccountViewController.swift
//  banking
//
//  Created by Hong Gao on 11/17/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {
    @IBAction func signOutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    @IBAction func checkingClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionTableViewController") as! TransactionTableViewController
        vc.childNode = "checking"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func savingsClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionTableViewController") as! TransactionTableViewController
        vc.childNode = "savings"
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
