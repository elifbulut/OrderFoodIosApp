//
//  LoginPageRouter.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import Foundation
class LoginPageRouter : PresenterToRouterLoginPage {
    static func createModule(ref: LoginPage) {
        ref.LoginPagePresenterObject = LoginPagePresenter()
        ref.LoginPagePresenterObject?.loginPageInteractor = LoginPageInteractor()
    }
}
