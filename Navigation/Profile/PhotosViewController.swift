//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Мамуля on 16.07.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    fileprivate lazy var profile: [Profile] = Profile.make()
    
    let spacing = 8.0
    
    enum CellID: String {
        case base = "ViewCell_ReuseID"
    }
    
    private let collectionView: UICollectionView = {
        let  viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: CellID.base.rawValue
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        view.backgroundColor = .white
        setupCollectionView()
        setupLayouts()
        
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupLayouts() {
        let sefeAreaGuide = view.safeAreaLayoutGuide
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: sefeAreaGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: sefeAreaGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: sefeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: sefeAreaGuide.trailingAnchor)
            
        ])
    }
}

extension PhotosViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        profile.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellID.base.rawValue,
            for: indexPath) as! PhotosCollectionViewCell
        
        let prof = profile[indexPath.row]
        cell.setup(with: prof)
        return cell
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = view.frame.width
        let numberOfColumns: CGFloat = 3.5
        let cellWidth = width / numberOfColumns

        return CGSize(width: cellWidth, height: cellWidth)
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        
        UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing)
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        spacing
    }
}
