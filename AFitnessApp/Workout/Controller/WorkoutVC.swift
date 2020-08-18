//
//  ViewController.swift
//  AFitnessApp
//
//  Created by nabeel.dce on 21/07/2020.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit


final class WorkoutVC: UIViewController {

    var safeArea: UILayoutGuide!
    
   
    let tableView = UITableView()
    
    let nameList = [WorkoutCellModel(
    title: "Ali",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5)),
                    
    WorkoutCellModel(
    title: "Muhammad",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5)),
    
    WorkoutCellModel(
    title: "Ahmed",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5)),
    
    WorkoutCellModel(
    title: "Kylie",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5)),
    
    WorkoutCellModel(
    title: "Kyle",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5)),
    
    WorkoutCellModel(
    title: "Nex",
    time: Int.random(in: 7...23),
    exersice: Int.random(in: 3...5))
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = .dimmedBlue
        setupNavigation()
        //setupContainerView()
        setupTableView()
    }

    private func setupNavigation(){
        navigationItem.title = "Workout"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customWhite]
        navigationController?.navigationBar.barTintColor = .dimmedBlue
        navigationController?.navigationBar.isTranslucent = false
        
        
    }
    
    

    private func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let top = tableView.topAnchor.constraint(equalTo: safeArea.topAnchor)
        let leading = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let bottom = tableView.bottomAnchor.constraint(equalTo:  view.bottomAnchor)
        let trailing = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
        
        tableView.backgroundColor = .dimmedBlue
        tableView.register(WorkoutCell.self, forCellReuseIdentifier: "cellid")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension WorkoutVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension WorkoutVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        guard let workoutCell = cell as? WorkoutCell else {
            return cell
        }
        
        let model = nameList[indexPath.row]
        workoutCell.set(model: model)
        return workoutCell
    }
  
    
    
}

