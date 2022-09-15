//
//  LoginPagePresenter.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import Foundation

class LoginPagePresenter: ViewToPresenterLoginPageProtocol {
    var loginPageInteractor: PresenterToInteractorLoginPageProtocol?
    
    func loginAll(email: String, password: String) {
        loginPageInteractor?.login(email: email, password: password)
    }
}
