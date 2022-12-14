//
//  Register.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 11.09.2022.
//

import UIKit
import Firebase

class Register: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var registerPresenterObject: ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
    }
    @IBAction func signUpButton(_ sender: Any) {
        if let emailText = emailTextField.text,
           let passwordText = passwordTextField.text {
                registerPresenterObject?.registerAll(email: emailText, password: passwordText)
            }
        }
    }

