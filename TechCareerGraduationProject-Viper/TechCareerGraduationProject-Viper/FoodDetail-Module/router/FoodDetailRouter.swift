//
//  FoodDetailRouter.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailVC) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
    }
}
