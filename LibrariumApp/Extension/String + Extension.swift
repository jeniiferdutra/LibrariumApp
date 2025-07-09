//
//  String + Extension.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 08/07/25.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
