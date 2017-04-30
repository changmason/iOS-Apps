//
//  ViewController.swift
//  TimesTable
//
//  Created by Chang Ming-hsuan on 30/04/2017.
//  Copyright © 2017 Chang Ming-hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func sliderChanged(_ sender: Any) {
        label.text = String(Int(slider.value))
        table.reloadData()
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let sliderValue = Int(slider.value)
        let result = sliderValue * (indexPath.row + 1)
        
        cell.textLabel?.text = "( \(sliderValue) x \(indexPath.row + 1) ) = \(result)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
