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
    
    private lazy var filterButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonTupped))
        return button
    }()
    
    private lazy var clearfilterButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearFilterButtonTupped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Избранное"
        layout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        likeService.fetchList { [weak self] list in
            self?.data = list
            self?.tableView.reloadData()
        }
        
    }
    
    @objc func filterButtonTupped() {
        let alertController = UIAlertController(title: "filter by author", message: "enter author's name", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "author's name"
        }
        
        let applyAction = UIAlertAction(title: "apply", style: .default) { [weak self, weak alertController] (_) in
            if let authorName = alertController?.textFields?.first?.text {
                self?.likeService.fetchItems(authorName: authorName) { [weak self] list in
                    self?.data = list
                    self?.tableView.reloadData()
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(applyAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func clearFilterButtonTupped() {
        likeService.clearFilter { [weak self] newList in
            self?.data = newList
            self?.tableView.reloadData()
        }
    }
        
    private func layout() {
        navigationItem.rightBarButtonItems = [clearfilterButton, filterButton]
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
            print(indexPath.row)
            likeService.delete(data[indexPath.row]) { [weak self] list in
                self?.data = list
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }

        }
    }
}
