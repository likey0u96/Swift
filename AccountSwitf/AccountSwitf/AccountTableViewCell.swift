//
//  AccountTableViewCell.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 16..
//  Copyright © 2019년 김유진. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    var account: CheckingAccount! { //account가 한번 셋팅이 될 때마다 할 것
        didSet{
            updateAccount()
        }
    }
    @IBOutlet weak var accountLabel : UILabel!
    
    @IBOutlet weak var balanceLabel : UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected){
            account.aMonthHasPassed() //model을 바꾸어 주고
//            accountLabel.text = account.accountNumber //label도 바꾸어 주어야한다
//            balanceLabel.text = String(account.balance) //리스트를 누를때 마다 변하도록 하게 하는데 Label에 보여줄 것
            //두 문장을 didSet에 넣어 (updateAccount()함수를 따로 만들어 )반복되는 문장을 한번에 처리할 수 있도록함
            updateAccount()
        }
        // Configure the view for the selected state
    }
    
    func updateAccount(){
        accountLabel.text = account.accountNumber //label도 바꾸어 주어야한다
        balanceLabel.text = String(account.balance) //리스트를 누를때 마다 변하도록 하게 하는데 Label에 보여줄 것
        
    }

}
