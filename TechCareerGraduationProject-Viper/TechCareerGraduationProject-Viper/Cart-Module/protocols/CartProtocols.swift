//
//  CartProtocols.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var cartInteractor : PresenterToInteractorCartProtocol? {get set}
    var cartView : PresenterToViewCartProtocol? {get set}
    
    func getAllCart()
    func deleteSingleItem(cart: FoodsDetail, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<FoodsDetail>)
    func getCount()

}
protocol PresenterToInteractorCartProtocol {
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func getCart()
    func deleteSingle(cart: FoodsDetail, kullanici_adi: String)
    
    func deleteAlltems(carts : Array<FoodsDetail>)
    func getCount()
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList : Array<FoodsDetail>)
    func sendDataToPresenter(foodCount : Int)
}

protocol PresenterToViewCartProtocol {
    func sendDataToView(cartList : Array<FoodsDetail>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterCartProtocol{
    static func createModule(ref:Cart)
}
