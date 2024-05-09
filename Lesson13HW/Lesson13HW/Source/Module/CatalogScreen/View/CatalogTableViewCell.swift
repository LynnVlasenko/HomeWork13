//
//  CatalogTableViewCell.swift
//  Lesson13HW
//
//  Created by Алина Власенко on 09.04.2024.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    static let identifier = "CatalogTableViewCell"
    
    let contentCellView = CatalogContentCellView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add subviews
    private func addSubviews() {
        contentView.addSubview(contentCellView)
    }
    
    // MARK: - Apply constraints
    private func applyConstraints() {
        
        contentCellView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewConstraints = [
            contentCellView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            contentCellView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            contentCellView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        NSLayoutConstraint.activate(contentViewConstraints)
    }
}
