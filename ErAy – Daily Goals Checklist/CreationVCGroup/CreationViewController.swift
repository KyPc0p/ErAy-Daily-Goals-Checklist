//
//  GoalViewController.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 31.10.2022.
//

import UIKit

class CreationViewController: UIViewController {
    
    let categoriesView = CategoriesView()
    let scrollView = UIScrollView()
    let popularGoalsView = PopularGoalsView()
    
    private lazy var newGoalTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Create your own"
        textField.borderStyle = .none
        textField.font = UIFont(name: "Avenir", size: 20)
        return textField
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Goal"
        view.backgroundColor = .white
        setupViews()
        setConstraints()
        addTap()
    }
    
    //MARK: - Functions
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(newGoalTextField)
        scrollView.addSubview(categoriesView)
        scrollView.addSubview(popularGoalsView)
    }
    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        scrollView.endEditing(true)
    }
}

//MARK: - Constraints
extension CreationViewController {
    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        newGoalTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newGoalTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            newGoalTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            newGoalTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
        
        categoriesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesView.topAnchor.constraint(equalTo: newGoalTextField.bottomAnchor, constant: 20),
            categoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        popularGoalsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularGoalsView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 20),
            popularGoalsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            popularGoalsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popularGoalsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popularGoalsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)  //как остановить ScrollView?
        ])
        
    }
}
