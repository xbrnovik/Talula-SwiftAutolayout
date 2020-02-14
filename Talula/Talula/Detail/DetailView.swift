//
//  DetailView.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailView: BaseView {
    
    private var didSetupConstraints = false
    
    let mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isZoomEnabled = true
        view.showsCompass = true
        return view
    }()
    
    let scaleView: MKScaleView = {
       let view = MKScaleView(mapView: nil)
        view.scaleVisibility = .visible
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init() {
        super.init()
        self.setNeedsUpdateConstraints()
        self.backgroundColor = .systemBackground
        self.view.addSubview(mapView)
        self.view.addSubview(scaleView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        scaleView.mapView = mapView
        
        if (!didSetupConstraints) {
            
            NSLayoutConstraint.activate([
                // mapView
                mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
                mapView.topAnchor.constraint(equalTo: topAnchor),
                mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
                // scaleView
                scaleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
                scaleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                scaleView.heightAnchor.constraint(equalToConstant: 25)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
