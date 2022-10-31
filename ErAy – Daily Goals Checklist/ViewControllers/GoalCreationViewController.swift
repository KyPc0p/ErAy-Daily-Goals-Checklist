//
//  GoalViewController.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 31.10.2022.
//

import UIKit

class GoalCreationViewController: UIViewController {
    
    private lazy var newGoalTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Create your own"
        textField.borderStyle = .none
        textField.font = UIFont(name: "Avenir", size: 20)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Goal"
        view.backgroundColor = .white
        setupSubviews(newGoalTextField)
        setConstraints()
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        newGoalTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newGoalTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            newGoalTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            newGoalTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

    }

}
