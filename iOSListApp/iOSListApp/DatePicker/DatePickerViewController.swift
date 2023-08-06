//
//  DatePickerViewController.swift
//  iOSListApp
//
//  Created by Muazzez Aydın on 29.07.2023.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        textField.inputView = datePicker
        
        
        datePicker?.addTarget(self, action: #selector( self.showDate(datePicker: )), for: .valueChanged)
        
        let touch = UIGestureRecognizer(target: self, action:#selector(self.closePicker))
        view.addGestureRecognizer(touch)
    }

    @objc func showDate(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        
        textField.text = date
    }
    
    @objc func closePicker(){
        view.endEditing(true)
    }

}
