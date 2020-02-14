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
        view.translatesAutoresizingMaskIntoConstraints = false
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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionAppLabel: UILabel = {
        let label = UILabel()
        label.text = "This application shows the list of fallen meteorites on Earth since 2011 and also its count. The meteorites are sorted by their masses in descending order. Source data is obtained from NASA and it is updated periodically. In the detail of every fallen meteorite, the user can see its position on map."
        label.font = Font.title3
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconsDescriptionStackView: InformationIconsStackView = {
        let view = InformationIconsStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let autorAppLabel: UILabel = {
        let label = UILabel()
        label.text = "This application was implemented by Diana Brnovik."
        label.font = Font.headline
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contactStackView: InformationContactStackView = {
        let view = InformationContactStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let licenseHeadlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Icons"
        label.font = Font.title3
        label.translatesAutoresizingMaskIntoConstraints = false
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
        view.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        if (!didSetupConstraints) {
            
            NSLayoutConstraint.activate([
                // outerView
                outerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                outerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                outerView.topAnchor.constraint(equalTo: topAnchor),
                outerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                // scrollView
                scrollView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: outerView.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor),
                // innerView
                innerView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor),
                innerView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor),
                innerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                innerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                // descriptionAppLabel
                descriptionAppLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: UIMargin.large),
                descriptionAppLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                descriptionAppLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                // iconsDescriptionStackView
                iconsDescriptionStackView.topAnchor.constraint(equalTo: descriptionAppLabel.bottomAnchor, constant: UIMargin.big),
                iconsDescriptionStackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                iconsDescriptionStackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                // autorAppLabel
                autorAppLabel.topAnchor.constraint(equalTo: iconsDescriptionStackView.bottomAnchor, constant: UIMargin.big),
                autorAppLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                autorAppLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                // contactStackView
                contactStackView.topAnchor.constraint(equalTo: autorAppLabel.bottomAnchor, constant: UIMargin.big),
                contactStackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                contactStackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                // licenseHeadlineLabel
                licenseHeadlineLabel.topAnchor.constraint(equalTo: contactStackView.bottomAnchor, constant: UIMargin.big),
                licenseHeadlineLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                licenseHeadlineLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                // licenseBodyTextView
                licenseBodyTextView.topAnchor.constraint(equalTo: licenseHeadlineLabel.bottomAnchor, constant: UIMargin.big),
                licenseBodyTextView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: UIMargin.big),
                licenseBodyTextView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -UIMargin.big),
                licenseBodyTextView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -UIMargin.big)
            ])
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}
