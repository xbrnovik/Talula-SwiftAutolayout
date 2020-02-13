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
        self.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(iconImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
                        
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: Constants.ui.bigCell),
                // iconImageView
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ui.bigMargin),
                iconImageView.heightAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.widthAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                // titleLabel
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.bigMargin),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
