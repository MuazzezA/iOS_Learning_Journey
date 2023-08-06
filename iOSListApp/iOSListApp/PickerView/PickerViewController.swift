//
//  PickerViewController.swift
//  iOSListApp
//
//  Created by Muazzez Aydın on 29.07.2023.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var resultlabel: UILabel!
    
//    @IBOutlet weak var pickerView: UIPickerView!
// 1.durum

// bunu bağlarsan istediğin yerde görünür (görsel olarak)
// 2.durumda bağlamadan yapılacak, sayfa oluştruğu anda oluşturulack ve textfield'a tıklandığında bottom:0 şeklinde gelecek
    
    var pickerView:UIPickerView?
    
    @IBOutlet weak var textField: UITextField!
    
    let hayvanlar = ["Kedi", "Köpek", "Aslan", "Kuş", "Tavşan", "Zebra", "Tavuk"]
    var seledtedAnimal:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView = UIPickerView()
        // 2.durumda bu şekilde oluşturuldu
        
        pickerView!.delegate = self
        pickerView!.dataSource = self
        
        textField.inputView = pickerView
        // 2.durumda picker viewın açılması textfielda bağlandı
        
        
        
        // 2.d üzerine buton ekleniyor
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.purple
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(title: "Tamam", style: .plain,
                                       target: self, action: #selector(self.okbutton))
        
        toolbar.setItems ([okButton], animated: true)
        textField.inputAccessoryView = toolbar
        // --
    }
    
    // button action 
    @objc func okbutton(){
        textField.text = "yeniden seç"
        view.endEditing(true)
    }
    
    // MARK: aşağıdaki yöntemler değişmiyor 1 ve 2 yöntemleri için değişmiyor
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        // bir satırda kaç sütun
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hayvanlar.count
        // dizi boyutu
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hayvanlar[row]
        // satırdaki değer
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultlabel.text = hayvanlar[row]
        seledtedAnimal = hayvanlar[row]
        textField.text = hayvanlar[row]
        // seçimdeki index - verinin seçildiği yer
    }
    
    @IBAction func showView(_ sender: UIButton) {
        print(seledtedAnimal ?? "nil selected")
        
    }
    
}



