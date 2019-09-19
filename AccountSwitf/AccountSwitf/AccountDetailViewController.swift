//
//  AccountDetailViewController.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 19..
//  Copyright © 2019년 김유진. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {

    var account : CheckingAccount?
    
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var amountTextFiled: UITextField!
    
    func reloadDate(){
        guard let account = account else{
            return
        }
        accountNumberLabel.text = account.accountNumber
        balanceLabel.text = String(account.balance)
        interestLabel.text = String(account.interest)

        
    }
    
    @IBAction func onDepositPressed(_ sender: Any) {
        guard let amount = Int(amountTextFiled.text!) else {
            return
        }
        
        account?.deposit(amount: amount)
        
        self.view.endEditing(true)
        
        reloadDate()
    }
    
    @IBAction func onWithdrawPressed(_ sender: Any) {
        guard let amount = Int(amountTextFiled.text!) else {
            return
        }
        
        _ = account?.withdraw(amount: amount)
        
        reloadDate()
    }
    
    
    override func viewDidLoad() { //대입한 후에 반영하는 부분(로드)
        super.viewDidLoad()

        reloadDate()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //키보드가 보여졌다는 노티를 줌 //키보드가 보이면 전체적인 뷰를 올려주기
    func keyboardDidShow(notification: NSNotification){
        guard let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else{
            return
        }
        
        self.view.frame.origin.y += keyboardHeight
        
    }
    //키보드가 사라지는것에 대한 함수
    func keyboardWillHide(notification : NSNotification){
        guard let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else{
            return
        }
        
        self.view.frame.origin.y -= keyboardHeight
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: .UIKeyboardDidShow , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide , object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        
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
