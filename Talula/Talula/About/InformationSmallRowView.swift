//
//  InformationSmallRowView.swift
//  Talula
//
//  Created by Diana Brnovik on 03/02/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class InformationSmallRowView: BaseView {
    
    private var didSetupConstraints = false
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "InformationGmail")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
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
                heightAnchor.constraint(equalToConstant: UICellSize.small),
                // iconImageView
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIMargin.small),
                iconImageView.heightAnchor.constraint(equalToConstant: UIIconSize.mini),
                iconImageView.widthAnchor.constraint(equalToConstant: UIIconSize.mini),
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
