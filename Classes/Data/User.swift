//
// Created by Chope on 2017. 1. 5..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct User: GithubData {
    public let id: String
    public let login: String
    public let gravatarId: String
    public let type: String
    public let siteAdmin: Bool
    public let name: String
    public let company: String
    public let location: String
    public let email: String
    public let hireable: Bool
    public let bio: String
    public let publicRepos: Int
    public let publicGists: Int
    public let followers: Int
    public let following: Int

    public let avatarURL: URL?
    public let htmlURL: URL?
    public let url: URL?
    public let followersURL: URL?
    public let followingURL: URL?
    public let gistsURL: URL?
    public let starredURL: URL?
    public let subscriptionsURL: URL?
    public let organizationsURL: URL?
    public let reposURL: URL?
    public let eventsURL: URL?
    public let receivedEventsURL: URL?
    public let blog: URL?

    public let createAt: Date?
    public let updateAt: Date?

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].stringValue
        login = json["login"].stringValue
        gravatarId = json["gravatar_id"].stringValue
        type = json["type"].stringValue
        siteAdmin = json["site_admin"].boolValue
        name = json["name"].stringValue
        company = json["company"].stringValue
        location = json["location"].stringValue
        email = json["email"].stringValue
        hireable = json["hireable"].boolValue
        bio = json["bio"].stringValue
        publicRepos = json["public_repos"].intValue
        publicGists = json["public_gists"].intValue
        followers = json["followers"].intValue
        following = json["following"].intValue

        avatarURL = json["avatar_url"].url
        htmlURL = json["html_url"].url
        url = json["url"].url
        followersURL = json["followers_url"].url
        followingURL = json["following_url"].url
        gistsURL = json["gists_url"].url
        starredURL = json["starred_url"].url
        subscriptionsURL = json["subscriptions_url"].url
        organizationsURL = json["organizations_url"].url
        reposURL = json["repos_url"].url
        eventsURL = json["events_url"].url
        receivedEventsURL = json["received_events_url"].url
        blog = json["blog"].url

        createAt = json["created_at"].date
        updateAt = json["updated_at"].date
    }
}