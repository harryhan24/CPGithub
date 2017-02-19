//
// Created by Chope on 2017. 1. 5..
// Copyright (c) 2017 Chope. All rights reserved.
//

import SwiftyJSON

public struct Issue: GithubData {
    public let id: Int
    public let number: Int
    public let title: String
    public let body: String
    public let state: String
    public let isLocked: Bool
    public let comments: Int

    public let user: User?
    public let assignee: User?
    public let milestone: Milestone?
    public let pullRequest: PullRequest?
    public let labels: [Label]

    public let closedAt: String?
    public let createdAt: String?
    public let updatedAt: String?

    public let url: URL?
    public let repositoryURL: URL?
    public let labelsURL: URL?
    public let commentsURL: URL?
    public let eventsURL: URL?
    public let htmlURL: URL?

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].intValue
        number = json["number"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
        state = json["state"].stringValue
        isLocked = json["locked"].boolValue
        comments = json["comments"].intValue

        user = User(rawJson: json["user"].dictionaryValue)
        assignee = User(rawJson: json["assignee"].dictionaryValue)
        milestone = Milestone(rawJson: json["milestone"].dictionaryValue)
        pullRequest = PullRequest(rawJson: json["pull_request"].dictionaryValue)

        let rawLabels = json["labels"].arrayValue
        var labels: [Label] = []
        rawLabels.forEach { rawJson in
            labels.append(Label(rawJson: rawJson))
        }
        self.labels = labels

        closedAt = json["closed_at"].stringValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue

        url = json["url"].url
        repositoryURL = json["repository_url"].url
        labelsURL = json["labels_url"].url
        commentsURL = json["comments_url"].url
        eventsURL = json["events_url"].url
        htmlURL = json["html_url"].url
    }
}
