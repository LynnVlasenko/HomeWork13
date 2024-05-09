//
//  FavoriteContentCellView.swift
//  Lesson13HW
//
//  Created by Алина Власенко on 09.04.2024.
//

import UIKit

class FavoriteContentCellView: UIView {
    
    // MARK: - UI
    
    private let idLbl: UILabel = {
        let label = UILabel()
        label.text = "код товару: " //id
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.text = "" // name
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    private let manufactureModelLbl: UILabel = {
        let label = UILabel()
        label.text = "" // manufacture + model
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        applyConstraints()
    }
    
    required init? (coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Add subviews
    private func addSubviews() {
        [idLbl, nameLbl, manufactureModelLbl]
            .forEach { self.addSubview($0) }
    }
    
    // MARK: - Apply constraints
    private func applyConstraints() {
        
        [idLbl, nameLbl, manufactureModelLbl]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let idLblConstraints = [
            idLbl.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            idLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            idLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            idLbl.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let nameLblConstraints = [
            nameLbl.topAnchor.constraint(equalTo: idLbl.bottomAnchor, constant: 16),
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLbl.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let manufactureModelLblConstraints = [
            manufactureModelLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 6),
            manufactureModelLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            manufactureModelLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            manufactureModelLbl.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        [idLblConstraints, nameLblConstraints, manufactureModelLblConstraints]
            .forEach { NSLayoutConstraint.activate($0) }
    }
    
    //MARK: - Configure cell
    public func configure(with model: Favorite) {
        
        idLbl.text = "код товару: \(String(model.id))"
        nameLbl.text = model.name
        manufactureModelLbl.text = "\(model.manufacturer), \(model.model)"
    }
}
