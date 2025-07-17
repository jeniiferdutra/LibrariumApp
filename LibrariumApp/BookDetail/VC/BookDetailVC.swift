//
//  BookDetailVC.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 10/05/25.
//

import UIKit
import AlamofireImage
import SafariServices

class BookDetailVC: UIViewController {
    
    private var viewModel: BookDetailViewModel
    private var screen: BookDetailScreen?
    
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        screen = BookDetailScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configProtocolsCollectionView(delegate: self, dataSource: self)
        viewModel.fetchBookDetail { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.configureData()
                self.screen?.collectionView.reloadData()
            }
        }
        screen?.delegate(delegate: self)
    }
    
    private func configureData() {
        screen?.titleLabel.text = viewModel.title
        screen?.authorsLabel.text = viewModel.author
        screen?.summaryTextLabel.text = viewModel.description
        
        if let url = viewModel.imageBookURL {
            screen?.coverImageView.af.setImage(withURL: url)
        } else {
            screen?.coverImageView.image = UIImage(named: "semcapa")
        }
    }
    
}

extension BookDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = viewModel.bookDetailData?.volumeInfo else {
            // Evita crash retornando uma célula "placeholder"
            let emptyCell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath)
            return emptyCell
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailCollectionViewCell.identifier,
            for: indexPath
        ) as? DetailCollectionViewCell else {
            fatalError("❌ Não foi possível fazer cast para DetailCollectionViewCell")
        }
        let cellViewModel = DetailCollectionViewViewModel(volumeInfo: data)
        cell.setupData(with: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 600, height: 85)
    }
}

extension BookDetailVC: BookDetailScreenProtocol {
    func tappedreadOnlineButton() {
        guard let urlString = viewModel.webReaderLink,
              let url = URL(string: urlString) else {
            let alert = UIAlertController(title: "Erro", message: "Link de leitura não disponível.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
