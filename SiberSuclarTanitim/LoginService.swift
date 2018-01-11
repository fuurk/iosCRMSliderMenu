//
//  LoginService.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 4.12.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import Foundation

struct Credentials {
    let username: String?
    let password: String?
}

struct LoginResponse {
    var isPasswordExpired: Bool
}

protocol LoginService {
    func login(with credentials: Credentials)
}

// MARK: - Helpers
extension Credentials: Equatable {
    static func ==(a: Credentials, b: Credentials) -> Bool {
        return a.username == b.username && a.password == b.password
    }
}
