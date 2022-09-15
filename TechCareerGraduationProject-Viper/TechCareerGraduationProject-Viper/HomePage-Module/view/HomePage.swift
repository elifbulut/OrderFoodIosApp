//
//  HomePage.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 13.09.2022.
//

import UIKit
import Alamofire
import Kingfisher
import Firebase

class HomePage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    //object
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var foodList = [Foods]()
    var filterFood = [Foods]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        searchBar.delegate = self
        HomePageRouter.createModule(ref: self)
        
        //collectionView Design
        let collectionViewDesign = UICollectionViewFlowLayout()
        collectionViewDesign.minimumLineSpacing = 10
        collectionViewDesign.minimumInteritemSpacing = 10
        collectionViewDesign.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let width = foodCollectionView.frame.size.width
        let cellWidht = (width - 30) / 2
        collectionViewDesign.itemSize = CGSize(width: cellWidht, height: cellWidht*1.5)
        foodCollectionView.collectionViewLayout = collectionViewDesign
    }
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.getFoods()
        homePagePresenterObject?.fetchFoodsAtCart()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "FoodDetail" {
               let food = sender as? Foods
               let destinationVC = segue.destination as! FoodDetailVC
               destinationVC.food = food
        }
    }
}
extension HomePage: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let food = filterFood[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        let rgb: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let black: [CGFloat]   = [0.0, 0.0, 0.0, 0.8]
        cell.layer.shadowColor = CGColor(colorSpace: rgb, components: black)
        cell.layer.shadowOpacity = 0.08;
        cell.layer.shadowRadius = 10;
        //cell.layer.shadowOffset = CGSizeMake(-2, 7)
        cell.foodName.text = food.yemek_adi!
        cell.foodPrice.text = "\(food.yemek_fiyat!).00 ₺"

        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)")
                {
                    DispatchQueue.main.async {
                        cell.foodImage.kf.setImage(with : url)
                    }
                }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = filterFood[indexPath.row]
        performSegue(withIdentifier: "FoodDetail", sender: food)
    }
    
}
extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterFood = self.foodList.filter { filter in
            if filter.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.foodCollectionView.reloadData()
    }
}
extension HomePage : PresenterToViewHomePageProtocol {
    func sendDataToView(foodsAtCart: Int) {
            //self.tabBarController?.tabBar.items![2].badgeValue = "\(foodsAtCart)"
            //self.tabBarController?.tabBar.items![2].badgeColor = UIColor(named: "SecondyColor")
        }
        func sendDataToView(foods: Array<Foods>) {
            self.foodList = foods
            self.filterFood = foods
            DispatchQueue.main.async {
                self.foodCollectionView.reloadData()
            }
        }
}
