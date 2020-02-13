//
//  BaseView.swift
//  Talula
//
//  Created by Diana Brnovik on 12/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    private var didSetupMainConstraints = false
    
    var view: UIView
    
    init() {
        view = UIView(frame: .zero)
        super.init(frame: CGRect.zero)
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupMainConstraints) {
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.topAnchor.constraint(equalTo: topAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            didSetupMainConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
