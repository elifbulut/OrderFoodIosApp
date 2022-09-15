//
//  Foods.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//
/* Swift'de “Codable” JSON'ları bir nesneye, nesneleri ise JSON yapılarına dönüştürmemize yardımcı olan bir protokoldür. Kullanacağımız yapıların (struct) veya sınıfların (class) bu işlemleri gerçekleştirebilmek için bu protokolü uygulaması (implement etmesi) gerekir. */
import Foundation
class Foods : Codable {
    var yemek_id : String?
    var yemek_adi : String?
    var yemek_fiyat : String?
    var yemek_resim_adi : String?
    init(){
    }
    init(yemek_id : String, yemek_adi : String, yemek_fiyat : String, yemek_resim_adi : String )
    {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_resim_adi = yemek_resim_adi
    }
}
