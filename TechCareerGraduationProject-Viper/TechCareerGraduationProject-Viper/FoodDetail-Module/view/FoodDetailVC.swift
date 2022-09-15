//
//  FoodDetail.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import UIKit
import Firebase
import Kingfisher

class FoodDetailVC: UIViewController {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    
    var count : Int = 1
    var food : Foods?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodDetailRouter.createModule(ref: self)
        
        if let f = food{
            foodName.text = f.yemek_adi
            totalPrice.text = "₺\(f.yemek_fiyat!).00"
            if let url = URL(string : "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)") {
                    DispatchQueue.main.async {
                        self.foodPic.kf.setImage(with : url)
                    }
                }
            }
        }
    func addFoodToCart(){
        if count >= 1 && count < 20{
            count += 1
            }
        countLabel.text = "\(count)"
        if let f = food
            {
                let totalFoodPrice = Int(f.yemek_fiyat!)
                totalPrice.text = "\(totalFoodPrice! * count).00 ₺"
            }
    }
    func takeFoodOutFromCart(){
        if count > 1 && count <= 20 {
            count -= 1
        }
        countLabel.text = "\(count)"
            if let f = food {
                let totalFoodPrice = Int(f.yemek_fiyat!)
                totalPrice.text = "\(totalFoodPrice! * count).00 ₺"
            }
        }
    @IBAction func minusButton(_ sender: Any) {
        takeFoodOutFromCart()
    }
    
    @IBAction func plusButton(_ sender: Any) {
        addFoodToCart()
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        if let f = food{
            foodDetailPresenterObject?.addAllFoodToCart(yemek_adi: f.yemek_adi!, yemek_fiyat: f.yemek_fiyat!, yemek_resim_adi: f.yemek_resim_adi!, yemek_siparis_adet: String(count), kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
            //alert
            let alert = UIAlertController(title: "Add To Cart", message: "\(f.yemek_adi!) added to cart!", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Okay", style: .default){ action in
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
        }
    }
}
