//
//  BookDetailVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit

class BookDetailVC: UIViewController {
    
    private let viewModel: BookDetailViewModel
    private var screen: BookDetailScreen?
    
    override func loadView() {
        screen = BookDetailScreen()
        view = screen
    }
    
    required init(info: VolumeInfo) {
        viewModel = BookDetailViewModel(info: info)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
}
