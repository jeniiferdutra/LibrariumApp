//
//  HomeScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = "Librarium App"
        imageView.accessibilityTraits = .staticText
        return imageView
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 20
        
        // Remover backgroundImage para garantir que o fundo seja branco
        search.backgroundImage = UIImage()
        search.barTintColor = UIColor(named: "appBackGroud")
        // Ajustar o fundo do campo de texto dentro da searchBar
        if let textField = search.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search",
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
        
        return search
    }()
    
    lazy var bookImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "books")
        return img
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore livros por categoria, descubra novas histórias."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .appBackGroud
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.bounces = false
        return tableView
    }()
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func configSearchBarDelegate(delegate: UISearchBarDelegate) {
            searchBar.delegate = delegate
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGroud
        addViews()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(searchBar)
        addSubview(bookImageView)
        bookImageView.addSubview(subTitleLabel)
        addSubview(tableView)
    }

    private func configElements() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 115),
            logoImageView.widthAnchor.constraint(equalToConstant: 260),

            searchBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            bookImageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookImageView.heightAnchor.constraint(equalToConstant: 250),
            
            subTitleLabel.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: -16),
            subTitleLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
