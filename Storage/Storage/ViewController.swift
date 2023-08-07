//
//  ViewController.swift
//  Storage
//
//  Created by Muazzez Aydın on 6.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let data = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveData(_ sender: Any) {
        
        data.set(textfield.text ?? "empty", forKey: "text")
        
        // file storage
        
        
        
    }
    
    @IBAction func readData(_ sender: Any) {
    
        let myText = data.string(forKey: "text")
        label.text = myText
        
        // file storage
        
        
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        data.removeObject(forKey:  "text")
        label.text = ""
        textfield.text = ""
        
        
        // file storage
        
    }
    
    

}

