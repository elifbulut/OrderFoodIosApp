//
//  Protocols.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import Foundation

//Main Protocols
protocol ViewToPresenterLoginPageProtocol {
    var loginPageInteractor : PresenterToInteractorLoginPageProtocol? {get set}
    func loginAll(email: String, password: String)
}
protocol PresenterToInteractorLoginPageProtocol {
    func login(email: String, password: String)
}
//Router
protocol PresenterToRouterLoginPage{
    static func createModule(ref: LoginPage)
}
