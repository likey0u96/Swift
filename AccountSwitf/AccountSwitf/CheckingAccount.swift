//
//  CheckingAccount.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 16..
//  Copyright © 2019년 김유진. All rights reserved.
//

import Foundation

class CheckingAccount : Account {
    
    init(accountNumber: String, balance: Int , interest: Double = 0.00){
        self.interest = interest
        super.init(accountNumber : accountNumber , balance : balance)  //상위 클래스의 생성자를 뒤에 호출해준다 (레이블은 필수!)
        
    }
    internal let interest : Double
    
    override func aMonthHasPassed() {
        balance = Int(Double(balance) * (1 + interest))
    }
    
    
    
    
    
    func withdraw(amount: Int) -> Bool{
        if(amount < balance){
            balance -= amount
            return true
        }else{
            return false
        }
    }
    
    func deposit(amount: Int){
        balance += amount
    }
    
    
}
