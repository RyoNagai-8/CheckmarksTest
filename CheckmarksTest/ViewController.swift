//
//  ViewController.swift
//  CheckmarksTest
//
//  Created by RyoNagai on 2021/06/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTableView: UITableView!
    
    var toDoItem: ToDoItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoItem == nil {
            toDoItem = ToDoItem(completed: false)
        }
        
        print("デバック：\(String(describing: toDoItem))")
        
        testTableView.delegate = self
        testTableView.dataSource = self
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, ListTableViewCellDelegate {
    
    func checkBoxToggle(sender: ListTableViewCell) {
        if let selectedIndexPath = testTableView.indexPath(for: sender){
            
            if toDoItem.completed == false {
                toDoItem.completed = true
                print("push\(selectedIndexPath.row):true")
            } else {
                toDoItem.completed = false
                print("push\(selectedIndexPath.row):false")
            }
            
           testTableView.reloadRows(at: [selectedIndexPath], with: .automatic)

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = testTableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ListTableViewCell
        
        cell.delegate = self
        
        cell.checkBoxButton.isSelected = toDoItem.completed
        
        cell.backgroundColor = .green
        
        return cell
    }
    
    
}

