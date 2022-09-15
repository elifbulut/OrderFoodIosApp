//
//  onboardingCollectionViewCell.swift
//  TechCareerGraduationProject-Viper
//
//  Created by Elıf on 8.09.2022.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: onboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: onboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
