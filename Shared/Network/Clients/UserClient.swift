//
//  UserClient.swift
//  Quotables
//
//  Created by Elikem Savie on 08/09/2023.
//

import Foundation
import Combine

class UserClient: NetworkUtil {

    func login(email: String, password: String) async throws -> AnyPublisher<User, Error> {
        let url = baseUrl.appendingPathComponent("login", isDirectory: false)

        return self.request(
            url: url,
            method: .post,
            params: [
                "username": email,
                "password": password
            ],
            expecting: User.self,
            verbose: true
        )
    }
}
