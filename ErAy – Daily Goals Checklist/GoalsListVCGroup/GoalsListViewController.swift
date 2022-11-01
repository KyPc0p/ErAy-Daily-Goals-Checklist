//
//  ViewController.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 31.10.2022.
//

import UIKit

class GoalsListViewController: UIViewController {
    
    private let plusView = PlusView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        return tableView
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupPlusView()
        setConstraints()
    }
    //MARK: - Functions
    private func setupNavigationBar(){
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = .white     //color change
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewGoal)
        )
        navigationController?.navigationBar.tintColor = .black   //color change
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    private func setupPlusView() {
        view.addSubview(plusView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addNewGoal))
        plusView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func addNewGoal() {
        let goalVC = CreationViewController()
        navigationController?.pushViewController(goalVC, animated: true)
    }
    
}

//MARK: - UITableViewDataSource
extension GoalsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = "New Task"
        return cell
    }
}

//MARK: - Constraints
extension GoalsListViewController {
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        plusView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            plusView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1),
            plusView.widthAnchor.constraint(equalToConstant: 60),
            plusView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
