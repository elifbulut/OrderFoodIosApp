//
//  OnboardingViewController.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 6.09.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingNextButton: UIButton!
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    var slides: [onboardingSlide] = []
    //Page control title change
    var currentPage = 0 {
        didSet{
            onboardingPageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                onboardingNextButton.setTitle("Get Started", for: .normal)
        } else {
            onboardingNextButton.setTitle("Next", for: .normal)
        }
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //Slides 
        UIBarButtonItem.appearance().tintColor = UIColor(red: 213/255.0, green: 254/255.0, blue: 80/255.0, alpha: 1.0)
        slides = [
                    onboardingSlide(title: "The Most Delicious Foods", description: "The chance to experience the most delicious food in the world.", image: #imageLiteral(resourceName: "foodie")),
                    onboardingSlide(title: "Fast Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "delivery-man")),
                    onboardingSlide(title: "You Can Order 24/7", description: "You can order from the phone whenever you want, regardless of the time.", image: #imageLiteral(resourceName: "online"))
                ]
        onboardingPageControl.numberOfPages = slides.count
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "LoginPage") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true, completion: nil)
            
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onboardingCollectionViewCell.identifier, for: indexPath) as! onboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
