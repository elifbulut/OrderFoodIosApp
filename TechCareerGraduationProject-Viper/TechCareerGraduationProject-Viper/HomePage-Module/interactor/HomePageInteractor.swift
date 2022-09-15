//
//  HomePageInteractor.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import Foundation
import Alamofire
import Firebase

class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method:.get).response { response in
                    if let data = response.data {
                        do {
                            let answer = try JSONDecoder().decode(FoodsResponse.self, from: data)
                            var list = [Foods]()
                            if let answerList = answer.yemekler {
                                list = answerList
                            }
                            self.homePagePresenter?.sendDataToPresenter(foods: list)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
    func fetchFoodsAtCart() {
        let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
               AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                   
                   if let data = response.data {
                       do {
                           let answer = try JSONDecoder().decode(FoodsDetailResponse.self, from: data)
                           var list = [FoodsDetail]()
                           if let answerList = answer.sepet_yemekler {
                               list = answerList
                           }
                           print(list)
                           self.homePagePresenter?.sendDataToPresenter(foodsAtCart: list.count);
                       } catch  {
                           print(error.localizedDescription)
                       }
                   }
               }
           }
       }
