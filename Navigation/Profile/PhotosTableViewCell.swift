//
//  PhotosTableViewCell.swift
//  Navigation


import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    let data = PostModel.make()
    
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: "CollectionCell_ID")
        
        return collectionView
    }()
    
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        contentView.addSubview(collectionView)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup -
   
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
   
    // MARK: - public -
    /*
    func setupImage(_ model: PostModel) {
        imageCell.image = UIImage(named: model.image)
    }
    */
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionCell_ID",
            for: indexPath
        ) as? CollectionViewCell else {
            fatalError("error collection cell")
        }
        cell.setupImage(data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
}
