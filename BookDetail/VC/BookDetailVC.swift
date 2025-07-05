//
//  BookDetailVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit
import AlamofireImage

class BookDetailVC: UIViewController {
    
    private let viewModel: BookDetailViewModel
    private var screen: BookDetailScreen?
    
    override func loadView() {
        screen = BookDetailScreen()
        view = screen
    }
    
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
    }
    
    private func configureData() {
        screen?.titleLabel.text = viewModel.titleText
        screen?.authorsLabel.text = viewModel.authorsText
        screen?.publisherLabel.text = viewModel.publisherText
        screen?.publishedDateLabel.text = viewModel.publishedDateText
        screen?.pageCountLabel.text = viewModel.pageCountText
        screen?.descriptionTextLabel.text = viewModel.descriptionText
        
        if let url = viewModel.imageURL {
            screen?.coverImageView.af.setImage(withURL: url)
        } else {
            screen?.coverImageView.image = UIImage(named: "semcapa")
        }
    }
    
}
