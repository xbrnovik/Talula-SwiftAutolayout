//
//  InformationView.swift
//  Talula
//
//  Created by Diana Brnovik on 03/02/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import UIKit

class InformationView: BaseView {
    
    private var didSetupConstraints = false
    
    let outerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.delaysContentTouches = false
        scrollView.autoresizesSubviews = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollsToTop = false
        scrollView.setContentOffset(.zero, animated: false)
        return scrollView
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let descriptionAppLabel: UILabel = {
        let label = UILabel()
        label.text = "This application shows the list of fallen meteorites on Earth since 2011 and also its count. The meteorites are sorted by their masses in descending order. Source data is obtained from NASA and it is updated periodically. In the detail of every fallen meteorite, the user can see its position on map."
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let iconsDescriptionStackView: InformationIconsStackView = {
        let view = InformationIconsStackView()
        return view
    }()
    
    let autorAppLabel: UILabel = {
        let label = UILabel()
        label.text = "This application was implemented by Diana Brnovik."
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let contactStackView: InformationContactStackView = {
        let view = InformationContactStackView()
        return view
    }()
    
    let licenseHeadlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Icons"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let licenseBodyTextView: UITextView = {
        let view = UITextView()
        view.text = "This application uses free icons availables on certain websites. \nThe source of application icon is https://icons8.com/. \nThe source of other icons is https://www.flaticon.com/."
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.isEditable = false
        view.dataDetectorTypes = .link
        view.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.textContainer.lineFragmentPadding = 0
        view.isScrollEnabled = false
        return view
    }()
    
    
    override init() {
        super.init()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(outerView)
        self.outerView.addSubview(scrollView)
        self.scrollView.addSubview(innerView)
        innerView.addSubview(descriptionAppLabel)
        innerView.addSubview(iconsDescriptionStackView)
        innerView.addSubview(autorAppLabel)
        innerView.addSubview(contactStackView)
        innerView.addSubview(licenseHeadlineLabel)
        innerView.addSubview(licenseBodyTextView)
        
        outerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        innerView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionAppLabel.translatesAutoresizingMaskIntoConstraints = false
        iconsDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        autorAppLabel.translatesAutoresizingMaskIntoConstraints = false
        contactStackView.translatesAutoresizingMaskIntoConstraints = false
        licenseHeadlineLabel.translatesAutoresizingMaskIntoConstraints = false
        licenseBodyTextView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
            
            NSLayoutConstraint.activate([
                outerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                outerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                outerView.topAnchor.constraint(equalTo: topAnchor),
                outerView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: outerView.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                innerView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor),
                innerView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor),
                innerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                innerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
            
            NSLayoutConstraint.activate([
                descriptionAppLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 20),
                descriptionAppLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                descriptionAppLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            NSLayoutConstraint.activate([
                iconsDescriptionStackView.topAnchor.constraint(equalTo: descriptionAppLabel.bottomAnchor, constant: Constants.ui.bigMargin),
                iconsDescriptionStackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                iconsDescriptionStackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            NSLayoutConstraint.activate([
                autorAppLabel.topAnchor.constraint(equalTo: iconsDescriptionStackView.bottomAnchor, constant: Constants.ui.bigMargin),
                autorAppLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                autorAppLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            NSLayoutConstraint.activate([
                contactStackView.topAnchor.constraint(equalTo: autorAppLabel.bottomAnchor, constant: Constants.ui.bigMargin),
                contactStackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                contactStackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            NSLayoutConstraint.activate([
                licenseHeadlineLabel.topAnchor.constraint(equalTo: contactStackView.bottomAnchor, constant: Constants.ui.bigMargin),
                licenseHeadlineLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                licenseHeadlineLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            NSLayoutConstraint.activate([
                licenseBodyTextView.topAnchor.constraint(equalTo: licenseHeadlineLabel.bottomAnchor, constant: Constants.ui.mediumMargin),
                licenseBodyTextView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: Constants.ui.bigMargin),
                licenseBodyTextView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -Constants.ui.bigMargin),
                licenseBodyTextView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -Constants.ui.bigMargin)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
