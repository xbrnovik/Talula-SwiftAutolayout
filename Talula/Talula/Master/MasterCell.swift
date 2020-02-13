//
//  MasterCell.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class MasterCell: UITableViewCell {
    
    private var didSetupConstraints = false
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "OtherMeteorite")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.numberOfLines = 1
        label.font = Constants.fonts.titleFont
        label.text = "Meteorite"
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.numberOfLines = 1
        label.font = Constants.fonts.subtitleFont
        label.text = "Mass"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitleLabel)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                iconImageView.widthAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ui.bigMargin+5),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.ui.bigMargin+5),
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.mediumMargin),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin)
            ])

            NSLayoutConstraint.activate([
                subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.ui.smallMargin),
                subTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.mediumMargin),
                subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin)
            ])

            didSetupConstraints = true

        }
        
        super.updateConstraints()
        
    }
    
}
