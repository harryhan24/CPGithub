//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Milestone: GithubData {
    public let id: Int
    public let number: Int
    public let state: String
    public let title: String
    public let description: String
    public let creator: User?
    public let openIssues: Int
    public let closedIssues: Int

    public let url: URL?
    public let htmlURL: URL?
    public let labelsURL: URL?

    public let createdAt: String
    public let updatedAt: String
    public let closedAt: String
    public let dueOn: String

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].intValue
        number = json["number"].intValue
        state = json["state"].stringValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        openIssues = json["open_issues"].intValue
        closedIssues = json["closed_issues"].intValue

        creator = User(rawJson: json["creator"])

        url = json["url"].url
        htmlURL = json["html_url"].url
        labelsURL = json["labels_url"].url

        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
        closedAt = json["closed_at"].stringValue
        dueOn = json["due_on"].stringValue
    }
}
