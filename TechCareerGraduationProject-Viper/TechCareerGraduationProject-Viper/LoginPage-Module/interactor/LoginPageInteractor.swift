//
//  LoginPageInteractor.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import Foundation
import Firebase

class LoginPageInteractor : PresenterToInteractorLoginPageProtocol {
    func login(email: String, password: String) {
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { authResult, error in }
            }
        }
