//
//  AddGoalView.swift
//  ErAy – Daily Goals Checklist
//
//  Created by Артём Харченко on 31.10.2022.
//

import Foundation
import UIKit

class addGoalView: UIView {
    
    private let plusView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(plusView)
        setPlusViewImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setPlusViewImage() {
        plusView.tintColor = .white
        plusView.contentMode = .center
        plusView.center = CGPoint(x: 30, y: 30)
        
        var config = UIImage.SymbolConfiguration(weight: .bold)
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20)))
        
        plusView.image = UIImage(systemName: "plus", withConfiguration: config)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let rect = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        context.setFillColor(UIColor.red.cgColor)              //color change
        context.addEllipse(in: rect)
        context.fillEllipse(in: rect)
    }
    
}
