//
//  MasterView.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class MasterView: BaseView {
    
    private var didSetupConstraints = false
    
    let listView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init() {
        super.init()
        self.setNeedsUpdateConstraints()
        self.backgroundColor = .white
        self.view.addSubview(listView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
       
        if (!didSetupConstraints) {
            
            NSLayoutConstraint.activate([
                listView.leadingAnchor.constraint(equalTo: leadingAnchor),
                listView.trailingAnchor.constraint(equalTo: trailingAnchor),
                listView.topAnchor.constraint(equalTo: topAnchor),
                listView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
