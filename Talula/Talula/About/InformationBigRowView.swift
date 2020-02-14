//
//  InformationBigCell.swift
//  Talula
//
//  Created by Diana Brnovik on 03/02/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class InformationBigRowView: BaseView {
    
    private var didSetupConstraints = false
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "BigMeteorite")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init() {
        super.init()
        self.setNeedsUpdateConstraints()
        self.backgroundColor = .systemBackground
        self.view.addSubview(titleLabel)
        self.view.addSubview(iconImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
                        
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: UICellSize.big),
                // iconImageView
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIMargin.big),
                iconImageView.heightAnchor.constraint(equalToConstant: UIIconSize.medium),
                iconImageView.widthAnchor.constraint(equalToConstant: UIIconSize.medium),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                // titleLabel
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: UIMargin.big),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIMargin.big),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
