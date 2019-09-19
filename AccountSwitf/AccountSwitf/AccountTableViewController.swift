//
//  AccountTableViewController.swift
//  AccountSwitf
//
//  Created by 김유진 on 2019. 9. 16..
//  Copyright © 2019년 김유진. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
    //Account와 CheckingAccount 모델을 만들고 둘을 TableView에 띄어주기 위해 선언하는 부분
    let accounts = [CheckingAccount(accountNumber : "123-456-7890",
                                    balance : 0,
                                    interest : 0.01),
                    CheckingAccount( accountNumber : "123-123-1234",
                                  balance : 1000,
                                     interest : 0.02),
                    CheckingAccount( accountNumber : "111-111-1111",
                                     balance : 1000000,
                                    interest : 0.02) ]
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        (view as? UITableView)?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1 //CheckingAccount 3개가 하나의 section 안에 보여지기 때문에 1임
    }

    //함수의 이름+label을 합쳐서 함수의 이름으로 형성한다. label이 다르면 다른함수임
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return accounts.count //section안에 몇개의 row가 있는지
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountTableViewCell
        

        // Configure the cell...
        cell.account = accounts[indexPath.row]
  //      cell.accountLabel.text = accounts[indexPath.row].accountNumber
  //      cell.balanceLabel.text = String(accounts[indexPath.row].balance) //두문장이 반복되는 것을 한번에 처리하는 방법을 찾아본다. -> account 생성자인 didset을 만들어 그곳에 해주면 이 두문장은 필요없게됨
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //원하는 작업을 넣으면 됨
        //모든 segue에 대해 이곳으로 들어옴 , 그래서 sugue마다 id를 부여해야함
        super.prepare(for: segue, sender: sender)
        
        if(segue.identifier == "ShowAccountDetailSegue" ){
            guard let selected = sender as? UITableViewCell else{
                fatalError("segue sender dose not look correct.")
            }
            
            //몇번째 꺼의 정보인지 가져올 수 있음
            guard let indexPath = tableView.indexPath(for: selected) else{
                fatalError("seleted entry is not in the account array")

            }
            
            //guard를 쓰는 이유 : segue.destination이 as?이므로 null이 될 수도 있다. null이 되었을 때 else문은 수행하라(null이 아님을 보장)
            guard let detailView = segue.destination as? AccountDetailViewController else {
                fatalError("segue destination is not correct.")
            }
            detailView.account = accounts[indexPath.row]

        }
    }
}












