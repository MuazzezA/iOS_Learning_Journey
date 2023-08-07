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
    @IBOutlet weak var errorLabel: UILabel!
    
    let data = UserDefaults.standard
    let imageName = "success"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveData(_ sender: Any) {
        
        data.set(textfield.text ?? "empty", forKey: "text")
        
        // file storage
        fileSave()
    }
    
    @IBAction func readData(_ sender: Any) {
    
        let myText = data.string(forKey: "text")
        label.text = myText
        
        // file storage
        fileRead()
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        data.removeObject(forKey:  "text")
        label.text = ""
        textfield.text = ""
        
        // file storage
        fileDelete()
    }
    
    
    func fileSave (){
        // resim dosyasının adı kayıt ediliyor, utf8 tr karaketer desteği için
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathExtension("imageNames.txt")
            
            do {
                try imageName.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                errorLabel.text = "file eklerken hata"
            }
        }
    }
    
    func fileRead (){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathExtension("imageNames.txt")
            
            do {
                let myImage = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
                image.image = UIImage(named: myImage)
            } catch {
                errorLabel.text = "file okurken hata"
            }
        }
    }
    
    func fileDelete (){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = dir.appendingPathExtension("imageNames.txt")
            
            if FileManager.default.fileExists(atPath: filePath.path) {
                do {
                    try FileManager.default.removeItem(at: filePath)
                    image.image = nil
                } catch {
                    errorLabel.text = "file silerken hata"
                }
            }
        }
        
        
    }
    

}

