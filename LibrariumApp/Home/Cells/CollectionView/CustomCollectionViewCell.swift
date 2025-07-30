//
//  CustomCollectionViewCell.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 18/04/25.
//

import UIKit
import AlamofireImage

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    private let homeScreen: CustomCollectionViewCellScreen = CustomCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(homeScreen)
        homeScreen.pin(to: contentView)
    }
    
    public func setupCell(with viewModel: CustomCollectionViewViewModel) {
        homeScreen.apply(viewModel: viewModel)
        homeScreen.configureAccessibility(with: viewModel.title)
    }
}
