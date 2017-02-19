//
// Created by Chope on 2017. 2. 9..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Repo: GithubData {
    public let id: Int64
    public let owner: User
    public let name: String
    public let fullName: String
    public let description: String
    public let `private`: Bool
    public let fork: Bool
//    public let language: String?
    public let forksCount: Int
    public let stargazersCount: Int
    public let watchersCount: Int
    public let size: Int
    public let defaultBranch: String
    public let openIssuesCount: Int
    public let hasIssues: Bool
    public let hasWiki: Bool
    public let hasPages: Bool
    public let hasDownloads: Bool

    public let url: URL?
    public let htmlURL: URL?
    public let archiveURL: URL?
    public let assigneesURL: URL?
    public let blobsURL: URL?
    public let branchesURL: URL?
    public let cloneURL: URL?
    public let collaboratorsURL: URL?
    public let commentsURL: URL?
    public let commitsURL: URL?
    public let compareURL: URL?
    public let contentsURL: URL?
    public let contributorsURL: URL?
    public let deploymentsURL: URL?
    public let downloadsURL: URL?
    public let eventsURL: URL?
    public let forksURL: URL?
    public let gitCommitsURL: URL?
    public let gitRefsURL: URL?
    public let gitTagsURL: URL?
    public let gitURL: URL?
    public let hooksURL: URL?
    public let issueCommentURL: URL?
    public let issueEventsURL: URL?
    public let issuesURL: URL?
    public let keysURL: URL?
    public let labelsURL: URL?
    public let languagesURL: URL?
    public let mergesURL: URL?
    public let milestonesURL: URL?
    public let mirrorURL: URL?
    public let notificationsURL: URL?
    public let pullsURL: URL?
    public let releasesURL: URL?
    public let sshURL: URL?
    public let stargazersURL: URL?
    public let statusesURL: URL?
    public let subscribersURL: URL?
    public let subscriptionURL: URL?
    public let svnURL: URL?
    public let tagsURL: URL?
    public let teamsURL: URL?
    public let treesURL: URL?
    public let homepage: URL?
    
    public let pushedAt: Date?
    public let createdAt: Date?
    public let updatedAt: Date?

    public init(rawJson: Any) {
        let json = JSON(rawJson)
        id = json["id"].int64Value
        owner = User(rawJson: json["owner"])
        name = json["name"].stringValue
        fullName = json["full_name"].stringValue
        description = json["description"].stringValue
        `private` = json[""].boolValue
        fork = json["fork"].boolValue
        forksCount = json["forks_count"].intValue
        stargazersCount = json["stargazers_count"].intValue
        watchersCount = json["watchers_count"].intValue
        size = json["size"].intValue
        defaultBranch = json["default_branch"].stringValue
        openIssuesCount = json["open_issues_count"].intValue
        hasIssues = json["has_issues"].boolValue
        hasWiki = json["has_wiki"].boolValue
        hasPages = json["has_pages"].boolValue
        hasDownloads = json["has_downloads"].boolValue

        url = json["_url"].url
        htmlURL = json["html_url"].url
        archiveURL = json["archive_url"].url
        assigneesURL = json["assignees_url"].url
        blobsURL = json["blobs_url"].url
        branchesURL = json["branches_url"].url
        cloneURL = json["clone_url"].url
        collaboratorsURL = json["collaborators_url"].url
        commentsURL = json["comments_url"].url
        commitsURL = json["commits_url"].url
        compareURL = json["compare_url"].url
        contentsURL = json["contents_url"].url
        contributorsURL = json["contributors_url"].url
        deploymentsURL = json["deployments_url"].url
        downloadsURL = json["downloads_url"].url
        eventsURL = json["events_url"].url
        forksURL = json["forks_url"].url
        gitCommitsURL = json["git_commits_url"].url
        gitRefsURL = json["git_refs_url"].url
        gitTagsURL = json["git_tags_url"].url
        gitURL = json["git_url"].url
        hooksURL = json["hooks_url"].url
        issueCommentURL = json["issue_comment_url"].url
        issueEventsURL = json["issue_events_url"].url
        issuesURL = json["issues_url"].url
        keysURL = json["keys_url"].url
        labelsURL = json["labels_url"].url
        languagesURL = json["languages_url"].url
        mergesURL = json["merges_url"].url
        milestonesURL = json["milestones_url"].url
        mirrorURL = json["mirror_url"].url
        notificationsURL = json["notifications_url"].url
        pullsURL = json["pulls_url"].url
        releasesURL = json["releases_url"].url
        sshURL = json["ssh_url"].url
        stargazersURL = json["stargazers_url"].url
        statusesURL = json["statuses_url"].url
        subscribersURL = json["subscribers_url"].url
        subscriptionURL = json["subscription_url"].url
        svnURL = json["svn_url"].url
        tagsURL = json["tags_url"].url
        teamsURL = json["teams_url"].url
        treesURL = json["trees_url"].url
        homepage = json["homepage"].url

        pushedAt = json["pushed_at"].date
        createdAt = json["created_at"].date
        updatedAt = json["updated_at"].date
    }

}
