//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Chris Rehagen on 1/23/19.
//  Copyright © 2019 Chris Rehagen. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var expensesArray = [Expense]()
    
    var dateFormatter = DateFormatter()
    var displayDateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
        
        displayDateFormatter.dateStyle = .medium
        displayDateFormatter.timeStyle = .short
        
        
        if let date = dateFormatter.date(from: "June 1, 2018 18:30"){
            expensesArray.append(Expense(title: "Dinner", amount: 32.50, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 12:17"){
            expensesArray.append(Expense(title: "Office Supplies", amount: 59.34, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 11:43"){
            expensesArray.append(Expense(title: "Uber", amount: 16.23, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 29, 2018 8:45"){
            expensesArray.append(Expense(title: "Coffee", amount: 3.95, date: date))
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expensesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        if let cell = cell as? ExpenseTableViewCell{
        
            let expense = expensesArray[indexPath.row]
            cell.titleLabel.text = expense.title
            
            let formattedAmount = String(format: "%.2f", expense.amount)
            
            cell.amountLabel.text = "$" + String(formattedAmount)
            cell.dateLabel.text = dateFormatter.string(from: expense.date)
            
        }
        
        return cell
    }
    

    

}
