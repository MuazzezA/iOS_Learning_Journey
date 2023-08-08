//
//  AnasayfaViModel.swift
//  MVVM_Start
//
//  Created by Muazzez Aydın on 7.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var sonuc = BehaviorSubject<String>(value: "0")
    // nesn oluşturmak çok önemli
    var mrepo = MathRepo()
    
    // init olmazsa olmaz çok önemli
    // iki sonucun birbirirne bağlanacağı yer
    init(){
        sonuc = mrepo.sonuc
    }
    
    // return üretmez genel yaklaşım böyle
    func toplamaYap (alinanSayi1: String, alinanSayi2: String){
        mrepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }

    func carpmaYap (alinanSayi1: String, alinanSayi2: String){
        mrepo.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    
    
}
