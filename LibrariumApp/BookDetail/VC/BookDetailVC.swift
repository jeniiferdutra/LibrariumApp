////
////  BookDetailVC.swift
////  LibrariumApp
////
////  Created by Jenifer Rocha on 10/05/25.
////
//
//import UIKit
//import AlamofireImage
//
//class BookDetailVC: UIViewController {
//    
//    private var viewModel: BookDetailViewModel
//    private var screen: BookDetailScreen?
//    
//    init(viewModel: BookDetailViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    override func loadView() {
//        screen = BookDetailScreen()
//        view = screen
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false
//}
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureData()
//        screen?.configProtocolsCollectionView(delegate: self, dataSource: self)
//        viewModel.fetchBookDetail { [weak self] in
//            self?.configureData()
//            self?.screen?.collectionView.reloadData()
//        }
//    }
//    
//    private func configureData() {
//        screen?.titleLabel.text = viewModel.title
//        screen?.authorsLabel.text = viewModel.author
//        screen?.summaryTextLabel.text = viewModel.description
//        
//        if let url = viewModel.imageBookURL {
//            screen?.coverImageView.af.setImage(withURL: url)
//        } else {
//            screen?.coverImageView.image = UIImage(named: "semcapa")
//        }
//    }
//    
//}
//
//extension BookDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let data = viewModel.bookDetailData
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier,for: indexPath) as? DetailCollectionViewCell
//        cell?.setupData(data: data, editionData: viewModel.editionDetailData)
//        return cell ?? UICollectionViewCell()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 500, height: 100)
//    }
//}
