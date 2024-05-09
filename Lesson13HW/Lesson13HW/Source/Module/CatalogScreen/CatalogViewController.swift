//
//  CatalogViewController.swift
//  Lesson13HW
//

//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var contentView: CatalogView!
    var model: CatalogModel!
    var favoriteModel: FavoriteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        model.saveChangesIfNeeded()
    }
    
    private func setupInitialState() {
        
        title = "Catalog"
        
        model = CatalogModel()
        favoriteModel = FavoriteModel()
        
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        registerTableViewCells()
    }
   
    // MARK: - Private
    private func registerTableViewCells() {
        
        contentView.tableView.register(
            CatalogTableViewCell.self,
            forCellReuseIdentifier: CatalogTableViewCell.identifier
        )
    }
}

// MARK: - CatalogModelDelegate
extension CatalogViewController: CatalogModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

// MARK: - CatalogViewDelegate
extension CatalogViewController: CatalogViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension CatalogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pcItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CatalogTableViewCell.identifier) as? CatalogTableViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = model.pcItems[indexPath.row]
        
        // configure cell with data
        cell.contentCellView.configure(with: item)
        
        // favoriteButtonTabComplition action
        cell.contentCellView.favoriteButtonTabComplition = { [weak self, indexPath] in
            guard let self = self else { return }
            
            let isFavorite = !model.pcItems[indexPath.row].favorite()
            model.updateItem(with: isFavorite, at: indexPath.row)
            
            if isFavorite {
                cell.contentCellView.favoriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
                favoriteModel.saveChangesIfNeeded() // update Favorite
            } else {
                cell.contentCellView.favoriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
                favoriteModel.saveChangesIfNeeded() // update Favorite
            }
        }
        
        return cell
    }
    
    // height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

// MARK: - UITableViewDelegate
extension CatalogViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
