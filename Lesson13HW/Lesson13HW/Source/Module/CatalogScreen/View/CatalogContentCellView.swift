//
//  CatalogContentCellView.swift
//  Lesson13HW
//
//  Created by Алина Власенко on 09.04.2024.
//

import UIKit

class CatalogContentCellView: UIView {
    
    var favoriteButtonTabComplition: (() -> ())?
    
    // MARK: - UI
    
    private let imagePc: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "pcPlaceholder")
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        return img
    }()
    
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
    
    private let priceCurrencyLbl: UILabel = {
        let label = UILabel()
        label.text = "" // price + currency
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let ratingLbl: UILabel = {
        let label = UILabel()
        label.text = "" // rating - show count of stars
        label.textColor = .systemYellow
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(didTabFavoriteButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        [imagePc, idLbl, nameLbl, manufactureModelLbl,
         priceCurrencyLbl, ratingLbl, favoriteButton]
            .forEach { self.addSubview($0) }
    }
    
    // MARK: - Actions
    
    //favorite button
    @objc private func didTabFavoriteButton() {
        favoriteButtonTabComplition?()
    }
    
    // MARK: - Apply constraints
    private func applyConstraints() {
        
        [imagePc, idLbl, nameLbl, manufactureModelLbl,
         priceCurrencyLbl, ratingLbl, favoriteButton]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let imagePcConstraints = [
            imagePc.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imagePc.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imagePc.widthAnchor.constraint(equalToConstant: 90),
            imagePc.heightAnchor.constraint(equalToConstant: 90)
        ]
        
        let idLblConstraints = [
            idLbl.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            idLbl.leadingAnchor.constraint(equalTo: imagePc.trailingAnchor, constant: 20),
            idLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            idLbl.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let nameLblConstraints = [
            nameLbl.topAnchor.constraint(equalTo: idLbl.bottomAnchor, constant: 16),
            nameLbl.leadingAnchor.constraint(equalTo: imagePc.trailingAnchor, constant: 20),
            nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLbl.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let manufactureModelLblConstraints = [
            manufactureModelLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 6),
            manufactureModelLbl.leadingAnchor.constraint(equalTo: imagePc.trailingAnchor, constant: 20),
            manufactureModelLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            manufactureModelLbl.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let ratingLblConstraints = [
            ratingLbl.topAnchor.constraint(equalTo: imagePc.bottomAnchor, constant: 10),
            ratingLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingLbl.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let priceCurrencyLblConstraints = [
            priceCurrencyLbl.topAnchor.constraint(equalTo: ratingLbl.bottomAnchor, constant: 10),
            priceCurrencyLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceCurrencyLbl.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -16),
            priceCurrencyLbl.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let favoriteButtonConstraints = [
            favoriteButton.topAnchor.constraint(equalTo: imagePc.bottomAnchor, constant: 20),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            favoriteButton.heightAnchor.constraint(equalToConstant: 28),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        [imagePcConstraints, idLblConstraints, nameLblConstraints, manufactureModelLblConstraints,
         ratingLblConstraints, priceCurrencyLblConstraints, favoriteButtonConstraints]
            .forEach { NSLayoutConstraint.activate($0) }
    }
    
    //MARK: - Configure cell
    public func configure(with model: Pc) {
        
        idLbl.text = "код товару: \(String(model.id))"
        nameLbl.text = model.name
        manufactureModelLbl.text = "\(model.manufacturer), \(model.model)"
        priceCurrencyLbl.text = "\(String(model.price)) \(model.currency)"
        
        model.isFavorite ?? false
        ? favoriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        : favoriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        
//        let firstRange = ratingText.startIndex ..< ratingText.index(ratingText.startIndex, offsetBy: model.rating)
//        let firstCharacters = ratingText[firstRange]
//        ratingLbl.text = String(ratingText[firstCharacters])
        
        // поки що так :)
        switch model.rating {
        case 0:
            ratingLbl.text = ""
        case 1:
            ratingLbl.text = "★☆☆☆☆"
        case 2:
            ratingLbl.text = "★★☆☆☆"
        case 3:
            ratingLbl.text = "★★★☆☆"
        case 4:
            ratingLbl.text = "★★★★☆"
        case 5:
            ratingLbl.text = "★★★★★"
        default: return ratingLbl.text = ""
        }
    }
}
