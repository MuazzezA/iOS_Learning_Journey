//
//  HomeViewController.swift
//  iOSListApp
//
//  Created by Muazzez Aydın on 29.07.2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    @IBAction func gotoDatePickerAct(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "DatePickerViewController", bundle: nil)
        
        let datePickerView = storyboard.instantiateViewController(withIdentifier: "DatePickerViewController") as! DatePickerViewController
        
        self.navigationController?.pushViewController(datePickerView, animated: true)
            
    }
    
    
    @IBAction func gotoPickerView(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        let pickerViewController = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as! PickerViewController
        
        self.navigationController?.pushViewController(pickerViewController, animated: true)
    }
    
    
    @IBAction func gotoTableView(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "TableViewController", bundle: nil)
        let tableViewgo = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        self.navigationController?.pushViewController(tableViewgo, animated: true)
        
    }
    

}
