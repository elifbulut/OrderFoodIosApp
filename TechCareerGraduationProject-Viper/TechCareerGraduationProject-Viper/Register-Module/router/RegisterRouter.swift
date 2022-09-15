//
//  RegisterRouter.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import Foundation

class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref: Register) {
        ref.registerPresenterObject = RegisterPresenter()
        ref.registerPresenterObject?.registerInteractor = RegisterInteractor()
    }
}
