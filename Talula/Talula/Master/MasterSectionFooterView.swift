//
//  MasterSectionFooterView.swift
//  Talula
//
//  Created by Diana Brnovik on 03/02/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class MasterSectionFooterView: UIView {
    private var didSetupConstraints = false
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UITableView().separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = Constants.fonts.bodyFont
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(separatorView)
        self.addSubview(titleLabel)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {

            backgroundColor = UIColor.white

            NSLayoutConstraint.activate([
                // separatorView
                separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
                separatorView.topAnchor.constraint(equalTo: topAnchor),
                separatorView.heightAnchor.constraint(equalToConstant: 2),
                // titleLabel
                titleLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])

            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
}
