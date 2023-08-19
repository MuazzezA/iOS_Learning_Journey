//
//  APIModel.swift
//  APIConnectApp
//
//  Created by Muazzez Aydın on 19.08.2023.
//

import Foundation


class PostModel:Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title, body
        }

        init(userID: Int?, id: Int?, title: String?, body: String?) {
            self.userID = userID
            self.id = id
            self.title = title
            self.body = body
        }
}
