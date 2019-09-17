//
//  AccountTableViewCell.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 16..
//  Copyright © 2019년 김유진. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    var account: CheckingAccount!
    @IBOutlet weak var accountLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected){
            account.aMonthHasPassed() //model을 바꾸어 주고
            accountLabel.text = String(describing: account!) //label도 바꾸어 주어야한다
        }
        // Configure the view for the selected state
    }

}
