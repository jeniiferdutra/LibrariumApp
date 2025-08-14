//
//  String + Extension.swift
//  LibrariumApp
//
//  Created by Jenifer Rocha on 08/07/25.
//

public enum ValidType {
    case email
    case password
}

import Foundation

extension String {
    //MARK: Formatação: Primeira letra maiúscula
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    // MARK: - Padrões Regex para tipos de validação
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
