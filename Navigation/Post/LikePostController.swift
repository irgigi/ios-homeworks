//
//  LikePostController.swift
//  Navigation


import UIKit

final class LikePostController: UIViewController {
    
    var data: [DataBaseModel] = []
    private let likeService = LikeService()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            LikeTableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Избранное"
        layout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        data = likeService.getItems()
        tableView.reloadData()
    }
        
    private func layout() {
        
        view.addSubview(tableView)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: safeAreaGuide.widthAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
        
}

extension LikePostController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? LikeTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        cell.autorLabel.text = data[indexPath.row].author
        cell.descriptionLabel.text = data[indexPath.row].text
        if let image = UIImage(named: data[indexPath.row].image!) {
            cell.imagePost.image = image
        }
        cell.likesLabel.text = ("Likes: " + data[indexPath.row].likes!)
        cell.viewsLabel.text = ("Views: " + data[indexPath.row].views!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //toDoService.deliteItem(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
