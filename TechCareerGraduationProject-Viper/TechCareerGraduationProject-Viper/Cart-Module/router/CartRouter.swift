//
//  CartRouter.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol {
    static func createModule(ref: Cart) {
        let presenter = CartPresenter()
        ref.cartPresenterObject = presenter
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
    }
}
