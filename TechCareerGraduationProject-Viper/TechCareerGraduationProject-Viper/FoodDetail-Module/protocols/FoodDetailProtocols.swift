//
//  FoodDetailProtocols.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol{
    var foodDetailInteractor : PresenterToInteractorFoodDetailProtocol? {get set}
        func addAllFoodToCart
    (
        yemek_adi : String,
        yemek_fiyat : String,
        yemek_resim_adi : String,
        yemek_siparis_adet:String,
        kullanici_adi:String
    )
}
protocol PresenterToInteractorFoodDetailProtocol{
   func addFoodToCart
    (
        yemek_adi : String,
        yemek_fiyat : String,
        yemek_resim_adi : String,
        yemek_siparis_adet:String,
        kullanici_adi:String
    )
}
protocol PresenterToRouterFoodDetailProtocol{
    static func createModule(ref:FoodDetailVC)
}
