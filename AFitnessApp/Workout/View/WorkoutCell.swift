//
//  WorkoutCell.swift
//  AFitnessApp
//
//  Created by nabeel.dce on 05/08/2020.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit


final class WorkoutCell : UITableViewCell{
    
    private let containerView = ContainerView()
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    private let timeLabel = LabelWithPostFix()
    private let exerciseLabel = LabelWithPostFix()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: - Public
    func set (model:WorkoutCellModel){
          titleLabel.text = model.title
          let timeLabelModel = LabelWithPostFix.Model(title: model.time.description, postFix: "min")
          timeLabel.set(model: timeLabelModel)
          
          let exerciseLabelModel = LabelWithPostFix.Model(title: model.exersice.description, postFix: "exersice")
          exerciseLabel.set(model: exerciseLabelModel)
    }
    
    //Mark: - Private
        
    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
       
        setupContainerView()
        setupStackView()
        setupTitleLabel()
        setupTimeLabel()
    }
       
       private func setupContainerView(){
           addSubview(containerView)
           containerView.translatesAutoresizingMaskIntoConstraints = false
           let leading = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
           let trailing = containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15)
           let top = containerView.topAnchor.constraint(equalTo: topAnchor,constant: 15)
           let bottom = containerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15)
           NSLayoutConstraint.activate([top,bottom,leading,trailing])
        
       }
       private func setupStackView(){
           addSubview(stackView)
           stackView.translatesAutoresizingMaskIntoConstraints = false
           let leading = stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
           let trailing = stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
           let height = stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3/4)
           let centerY = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
           
           NSLayoutConstraint.activate([height,centerY, leading,trailing])
           stackView.axis = .vertical
           stackView.distribution = .fillEqually
       }
       
       private func setupTitleLabel(){
        
           stackView.addArrangedSubview(titleLabel)
           titleLabel.text = "30 minutes Workout"
           titleLabel.textColor = .customWhite
           
           titleLabel.font = .boldSystemFont(ofSize: 33)
           titleLabel.adjustsFontSizeToFitWidth = true
       }
       
       private func setupTimeLabel(){
           let container = UIView()
           stackView.addArrangedSubview(container)
           container.addSubview(timeLabel)
           container.addSubview(exerciseLabel)
           
           let _ = {
           
               timeLabel.translatesAutoresizingMaskIntoConstraints = false
               let top = timeLabel.topAnchor.constraint(equalTo: container.topAnchor)
               let leading = timeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor)
               let height =  timeLabel.heightAnchor.constraint(equalTo: container.heightAnchor)
               NSLayoutConstraint.activate([top, leading, height])
               
               timeLabel.set(model: LabelWithPostFix.Model(title: "22", postFix: "min"))
              
           }()
           
          let _ = {
          
            exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
            let top = exerciseLabel.topAnchor.constraint(equalTo: container.topAnchor)
            let leading = exerciseLabel.leadingAnchor.constraint(equalTo: self.timeLabel.trailingAnchor, constant: 15)
            let height = exerciseLabel.heightAnchor.constraint(equalTo: container.heightAnchor)
            NSLayoutConstraint.activate([top, leading, height])
          
            exerciseLabel.set(model: LabelWithPostFix.Model(title: "8", postFix: "exerices"))
               }()
       }
    
    
}
