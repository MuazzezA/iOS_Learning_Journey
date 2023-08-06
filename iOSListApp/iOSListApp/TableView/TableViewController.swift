//
//  TableViewController.swift
//  iOSListApp
//
//  Created by Muazzez Aydın on 29.07.2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
   
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

}
