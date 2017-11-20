//
//  TransactionTableViewController.swift
//  banking
//
//  Created by Hong Gao on 11/17/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit
import Firebase

class TransactionTableViewController: UITableViewController {
    
    var transactions = [Transaction]()
    
    var childNode: String!
    
    struct Storyboard {
        static let TransactionCell = "TransactionCell"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchTransactions()
        
        self.title = "Transaction"
        
        let barItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutClicked(_:)))
        self.navigationItem.rightBarButtonItem = barItem
    }
    
    @objc func signOutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    func fetchTransactions() {
        
        Database.database().reference().child(childNode).observe(.value, with: { (snapshot) in
            
            self.transactions.removeAll()
            for item in snapshot.children {
                let ele: DataSnapshot = item as! DataSnapshot
                if let dictionary = ele.value as? [String: Any] {
                    let transaction = Transaction()
                    
                    transaction.Date = dictionary["date"] as? String
                    transaction.Amount = dictionary["amount"] as? String
                    transaction.Title = dictionary["title"] as? String
                    transaction.Description = dictionary["description"] as? String
                    transaction.Banlance = dictionary["balance"] as? String
                    
                    self.transactions.append(transaction)
                }
            }
            
            self.tableView.reloadData()
        }, withCancel: nil)
    }
    
}

extension TransactionTableViewController
{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TransactionCell, for: indexPath) as! TransactionCell
        
        cell.transaction = self.transactions[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }

}
