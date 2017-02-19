//
// Created by Chope on 2017. 1. 15..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Comment: GithubData {
    public let id: Int
    public let body: String
    public let user: User?

    public let createdAt: String
    public let updatedAt: String

    public let url: URL?
    public let htmlURL: URL?

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].intValue
        url = json["url"].url
        htmlURL = json["url"].url
        body = json["body"].stringValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue

        user = User(rawJson: json["user"].dictionaryValue)
    }
}
