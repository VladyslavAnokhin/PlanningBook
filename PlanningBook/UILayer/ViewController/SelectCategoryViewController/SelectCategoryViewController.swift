//
//  SelectCategoryViewController.swift
//  PlanningBook
//
//  Created by vladyslav.anokhin on 3/22/17.
//  Copyright © 2017 DDi Development. All rights reserved.
//

import UIKit

class SelectCategoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(cell: CategoryCollectionViewCell.self)
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    var cellAnimator: ViewAnimatorProtocol!
    var interactor: CategoryInteractorProtocol!
    var dataSource = [CategoryCollectionViewCellModel]()
    
    var controllerFactory: AddNoteModuleAssembly!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.3, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCategories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let visibleCell = self.collectionView.visibleCells
        cellAnimator.candidates = visibleCell
        cellAnimator.run()
    }
    
    func fetchCategories(){
        interactor.fetch { (categories, error) in
            if let categories = categories {
                self.dataSource.removeAll()
                
                let addNewOneCell = CategoryCollectionViewCellModel(name: "Add new one +", numberOfNotes: " ")
                self.dataSource += [ addNewOneCell ]
                self.dataSource += categories.map{ CategoryCollectionViewCellModel(category: $0) }
                self.collectionView.reloadData()
            }
        }
    }
    
    func alertController() -> UIAlertController {
        
        let alertController = UIAlertController(title: "Add new category", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Category name"
        })
        
        let action = UIAlertAction(title: "Add",
                                   style: .default,
                                   handler: { (action) in
            let tf = alertController.textFields!.first!
            
            if !tf.text!.isEmpty {
                let newCategory = Category(name: tf.text!, numberOfNotes: 0)
                self.interactor.save(newCategory: newCategory, completion: { (success, error) in
                    if success {
                        self.fetchCategories()
                    }
                })
            }
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        alertController.addAction(cancel)
        
        return alertController
    }
}

extension SelectCategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier,
                                                                      for: indexPath) as! CategoryCollectionViewCell
        cell.cellModel = dataSource[indexPath.row]
        return cell
    }
    
}

extension SelectCategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            present(alertController(), animated: true, completion: nil)
        } else {
            let nextController = controllerFactory.addNoteViewController()
            let cellModel = dataSource[indexPath.item]
            let selectedCategory = Category(name: cellModel.name,
                                            numberOfNotes: Int( cellModel.numberOfNotes )! )
            nextController.category = selectedCategory
            navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size
        
        let itemWidth = (collectionViewSize.width / 2) - 10
        let itemHeight = itemWidth
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
