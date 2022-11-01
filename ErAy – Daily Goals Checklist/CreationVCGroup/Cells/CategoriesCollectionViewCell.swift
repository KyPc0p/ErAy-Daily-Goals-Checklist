//
//  TypesCollectionViewCell.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 01.11.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "FFFFF"
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = UIColor.gray.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setupViews() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 15
        addSubview(textLabel)
    }
}

//MARK: - Constraints
extension CategoriesCollectionViewCell {
    private func setConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}
