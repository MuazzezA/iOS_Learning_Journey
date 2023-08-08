//
//  ViewController.swift
//  MVVM_Start
//
//  Created by Muazzez Aydın on 7.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfieldsayi1: UITextField!
    @IBOutlet weak var textfieldsayi2: UITextField!
    
    // model nesnesi oluşturuldu
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        label.text = viewModel.sonuc
        
        var test = viewModel.sonuc.subscribe(onNext: { s in //dinleme
            self.label.text = s
        })
        print("test : \(test)")
    }
    
    @IBAction func topla(_ sender: Any) {
        
        if let alinanSayi1 = textfieldsayi1.text,let alinanSayi2 = textfieldsayi2.text {
            
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
//            label.text = viewModel.sonuc
            
        }
        
    }
        
        @IBAction func carp(_ sender: Any) {
            
            if let alinanSayi1 = textfieldsayi1.text,let alinanSayi2 = textfieldsayi2.text {
                
                viewModel.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
//                label.text = viewModel.sonuc
                
            }
        }
        
        
        
    }
    

