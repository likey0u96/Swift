//
//  Account.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 16..
//  Copyright © 2019년 김유진. All rights reserved.
//

import Foundation


class Account : CustomStringConvertible {
    init(accountNumber: String, balance: Int = 0){
        self.accountNumber  = accountNumber   //생성자에 있는 string 타입을 가져오므로 :string을 생략
        self.balance = balance
        
    }
    
    let accountNumber : String  //코틀린과 다르게 타입을 써주어야한다
    public internal(set) var balance : Int {
        didSet {  //balance 값이 바뀌고 나면 didset으로 들어감
            print("Balance change: \(oldValue) -> \(balance)")
        }
    }
    
    
    
    
    func aMonthHasPassed(){
        fatalError("It must have been overriden.")
        
    }
    
    
    public var description : String {
        return accountNumber + ": \(balance)"
    }
    
}
