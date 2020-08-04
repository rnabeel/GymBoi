//
//  ContainerView.swift
//  AFitnessApp
//
//  Created by nabeel.dce on 21/07/2020.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit

final class ContainerView : UIView{
    
    private let upperShadowView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
     
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkShadow.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.backgroundColor = UIColor.dimmedBlue.cgColor
        layer.masksToBounds = false
        
        setupUpperShadowView()
    }
    
    private func setupUpperShadowView(){
        addSubview(upperShadowView)
        upperShadowView.translatesAutoresizingMaskIntoConstraints = false
        let top = upperShadowView.topAnchor.constraint(equalTo: topAnchor)
        let leading = upperShadowView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let bottom = upperShadowView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let trailing = upperShadowView.trailingAnchor.constraint(equalTo: trailingAnchor)
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
        
        upperShadowView.layer.cornerRadius = 10
        upperShadowView.layer.shadowColor = UIColor.lightShadow.cgColor
        upperShadowView.layer.shadowOpacity = 0.8
        upperShadowView.layer.shadowRadius = 5
        upperShadowView.layer.shadowOffset = CGSize(width: -3, height: -3)
        upperShadowView.layer.backgroundColor = UIColor.dimmedBlue.cgColor
        upperShadowView.layer.masksToBounds = false
        
        
    }
}
