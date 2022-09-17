//
//  myCart.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import UIKit
import Firebase
import Alamofire
import Kingfisher

class Cart: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var cartFoods = [FoodsDetail]()
    var foodsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CartRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        cartPresenterObject?.getAllCart()
        cartPresenterObject?.getCount()
    }
    @IBAction func placeOrderButton(_ sender: Any) {
        performSegue(withIdentifier: "finalVC", sender: nil)
    }
    @IBAction func deleteAllItems(_ sender: Any) {
        self.cartPresenterObject?.deleteAlltems(carts: cartFoods)
        self.cardTableView.reloadData()
        self.cardTableView.dataSource = nil
        totalPriceLabel.text = "0"
    }
}
extension Cart : PresenterToViewCartProtocol {
    func sendDataToView(cartList: Array<FoodsDetail>) {
        self.cartFoods = cartList
        DispatchQueue.main.async {
            self.cardTableView.reloadData()
            var total = 0
            self.cartFoods.forEach { cart_food in
                total = total + (Int(cart_food.yemek_fiyat ?? "0")! * Int(cart_food.yemek_siparis_adet ?? "0")!)
            }
            self.totalPriceLabel.text = "\(total).00 ₺"
        }
    }
    func sendDataToView(foodCount: Int) {
        self.foodsCount = foodCount
        DispatchQueue.main.async {
            self.cardTableView.reloadData()
            //print(self.foodsCount)
        }
    }
}
extension Cart : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartFoods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartFood = cartFoods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.foodNameL.text = cartFood.yemek_adi!
        cell.foodPrice.text = "\(Int(cartFood.yemek_fiyat!)!).00 ₺"
        cell.foodCount.text = "\(cartFood.yemek_siparis_adet!) pc"
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(cartFood.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.foodImageV.kf.setImage(with: url)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view,bool) in
                let cart = self.cartFoods[indexPath.row]
                self.cartFoods.remove(at: indexPath.row)
                self.cartPresenterObject?.deleteSingleItem(cart: cart, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
                tableView.reloadData()
                  self.foodsCount -= 1
                    if self.foodsCount == 0 {
                        self.totalPriceLabel.text = "0"
                   }
                    print(self.foodsCount)
                }
                return UISwipeActionsConfiguration(actions: [deleteAction])
            }
}

