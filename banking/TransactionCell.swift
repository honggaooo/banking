//
//  TransactionCell.swift
//  banking
//
//  Created by Hong Gao on 11/17/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit


class TransactionCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var transaction: Transaction! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        titleLabel.text = transaction.Title
        amountLabel.text = transaction.Amount
        desLabel.text = transaction.Description
        balanceLabel.text = transaction.Banlance
        dateLabel.text = transaction.Date
    }
}
