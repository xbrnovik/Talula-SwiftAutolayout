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
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init() {
        super.init()
        self.setNeedsUpdateConstraints()
        self.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(iconImageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
            
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: Constants.ui.smallCell)
            ])
            
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ui.smallMargin),
                iconImageView.heightAnchor.constraint(equalToConstant: Constants.ui.miniIconSize),
                iconImageView.widthAnchor.constraint(equalToConstant: Constants.ui.miniIconSize),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.bigMargin),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
