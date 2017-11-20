//
//  Transaction.swift
//  banking
//
//  Created by Hong Gao on 11/17/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit
class Transaction: NSObject {
    
    var Date: String?
    var Amount: String?
    var Title: String?
    var Banlance: String?
    var Description: String?
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("Transaction undefineKey:\(key)");
    }

}
