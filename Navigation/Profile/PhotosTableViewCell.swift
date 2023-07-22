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
        
      //  addSubview(imageCell)
        
       // setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup -
   /*
    private func setupLayouts() {
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageCell.topAnchor.constraint(equalTo: topAnchor),
            imageCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCell.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
   
    // MARK: - public -
    
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
        data.count
    }
}
