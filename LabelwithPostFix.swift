//
//  LabelwithPostFix.swift
//  AFitnessApp
//
//  Created by nabeel.dce on 04/08/2020.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit

final class LabelWithPostFix: UIView{
    
    private let label = UILabel()
    private let postFixLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Mark: -Public
    
    func set(model: Model){
        label.text = model.title
        postFixLabel.text = model.postFix
    }
    
    
    
    // Mark: -Private
    
    private func debug(){
        label.backgroundColor = .yellow
        postFixLabel.backgroundColor = .blue
    }
        
    private func setupView(){
        setupLabel()
        setupPostFixLabel()
    }
     
    private func setupLabel(){
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let top = label.topAnchor.constraint(equalTo: topAnchor)
        let leading = label.leadingAnchor.constraint(equalTo: leadingAnchor)
        
        NSLayoutConstraint.activate([top,leading])
        
        label.textColor = .customRed
        label.font = .boldSystemFont(ofSize: 32)
    }
    
    private func setupPostFixLabel(){
        addSubview(postFixLabel)
        
        postFixLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottom = postFixLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -3)
        let leading = postFixLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor)
        let trailing = postFixLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        NSLayoutConstraint.activate([bottom,leading,trailing])
        
        postFixLabel.textColor = .lightDimmedBlue
        postFixLabel.font = .boldSystemFont(ofSize: 16)
        
    }
}

extension LabelWithPostFix {
    struct Model{
        let title: String
        let postFix: String
    }
    
    enum Postfix{
        case min
        case exersice
    }
}
