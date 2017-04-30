//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Chang Ming-hsuan on 30/04/2017.
//  Copyright © 2017 Chang Ming-hsuan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        var todoItems: [String]
        
        if let todoItemsObject = UserDefaults.standard.object(forKey: "items") {
            todoItems = todoItemsObject as! [String]
        } else {
            todoItems = [String]()
        }
        
        todoItems.append(itemTextField.text!)
        UserDefaults.standard.set(todoItems, forKey: "items")
        itemTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
