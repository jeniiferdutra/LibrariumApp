//
//  HomeScreen.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 16/04/25.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedLogoutButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
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
    
    lazy var logoutButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Exit", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLogoutButton() {
        self.delegate?.tappedLogoutButton()
    }
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 20
        search.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        search.backgroundColor = .appBackGroud
        search.placeholder = "Search"
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .appBackGroud
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
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
        addSubview(logoutButton)
        addSubview(searchBar)
        addSubview(tableView)
    }

    private func configElements() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            logoutButton.topAnchor.constraint(equalTo: logoImageView.topAnchor),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            searchBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
