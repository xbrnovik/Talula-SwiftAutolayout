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
        label.font = Font.title
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
        label.font = Font.subtitle
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
                iconImageView.widthAnchor.constraint(equalToConstant: UIIconSize.medium),
                iconImageView.heightAnchor.constraint(equalToConstant: UIIconSize.medium),
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIMargin.large),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                // titleLabel
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIMargin.large),
                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: UIMargin.medium),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIMargin.big),
                // subTitleLabel
                subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UIMargin.small),
                subTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: UIMargin.medium),
                subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIMargin.big)
            ])

            didSetupConstraints = true

        }
        
        super.updateConstraints()
        
    }
}
