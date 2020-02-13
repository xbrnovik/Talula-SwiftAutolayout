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
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        label.translatesAutoresizingMaskIntoConstraints = false
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
        label.translatesAutoresizingMaskIntoConstraints = false
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
            
            NSLayoutConstraint.activate([
                // iconImageView
                iconImageView.widthAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: Constants.ui.iconSize),
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ui.bigMargin+5),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                // titleLabel
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.ui.bigMargin+5),
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.mediumMargin),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin),
                // subTitleLabel
                subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.ui.smallMargin),
                subTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.ui.mediumMargin),
                subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ui.bigMargin)
            ])

            didSetupConstraints = true

        }
        
        super.updateConstraints()
        
    }
}
