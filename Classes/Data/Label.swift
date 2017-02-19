//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Label: GithubData {
    public let id: Int
    public let url: URL?
    public let name: String
    public let color: String
    public let isDefault: Bool

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].intValue
        url = json["url"].url
        name = json["name"].stringValue
        color = json["color"].stringValue
        isDefault = json["default"].boolValue
    }
}
