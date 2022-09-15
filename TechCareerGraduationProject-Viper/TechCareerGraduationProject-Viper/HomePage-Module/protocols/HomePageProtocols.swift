//
//  HomePageProtocols.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation
//Presenter
protocol ViewToPresenterHomePageProtocol {
    var homePageInteractor : PresenterToInteractorHomePageProtocol? {get set}
    var homePageView : PresenterToViewHomePageProtocol? {get set}
        
        func getFoods()
        func fetchFoodsAtCart()
}
//Interactor
protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter : InteractorToPresenterHomePageProtocol? {get set}
    
    func getAllFoods()
    func fetchFoodsAtCart()
}
//
protocol InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(foods : Array<Foods>)
    func sendDataToPresenter(foodsAtCart : Int)
}
protocol PresenterToViewHomePageProtocol {
    func sendDataToView(foods : Array<Foods>)
    func sendDataToView(foodsAtCart : Int)
}
//Router
protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePage)
}
