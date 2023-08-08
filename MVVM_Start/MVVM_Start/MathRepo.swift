//
//  MathRepo.swift
//  MVVM_Start
//
//  Created by Muazzez Aydın on 7.08.2023.
//

import Foundation
import RxSwift

// işlem yükü buraya aktarıldı - viewmodel yönetici olacak
// MathematicRepository
class MathRepo {
    var sonuc = BehaviorSubject<String>(value: "0")
    
    // return üretmez genel yaklaşım böyle
    func toplamaYap (alinanSayi1: String, alinanSayi2: String){
        if let sayi1 = Int(alinanSayi1),let sayi2 = Int(alinanSayi2) {
            let toplam = sayi1 + sayi2
            sonuc.onNext(String(toplam)) // tetikleme
        }
    }

    func carpmaYap (alinanSayi1: String, alinanSayi2: String){
        if let sayi1 = Int(alinanSayi1),let sayi2 = Int(alinanSayi2) {
            let carpma = sayi1 * sayi2
            sonuc.onNext(String(carpma)) // tetikleme
        }
    }
}
