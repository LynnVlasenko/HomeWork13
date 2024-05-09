//
//  FavoriteTableViewCell.swift
//  Lesson13HW
//
//  Created by Алина Власенко on 09.04.2024.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    static let identifier = "FavoriteTableViewCell"
    
    let contentCellView = FavoriteContentCellView() // add view
    
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
            contentCellView.heightAnchor.constraint(equalToConstant: 114)
        ]
        
        NSLayoutConstraint.activate(contentViewConstraints)
    }

}
