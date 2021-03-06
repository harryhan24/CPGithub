//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Alamofire


public enum GithubRepositories {
    case all
    case ownedAndMember
    case organization(name: String)
    case repository(owner: String, repo: String)
    case users(name: String)
}


public enum GithubRouter: URLRequestConvertible {
    case issue(repositories: GithubRepositories, number: Int)
    case issues(repositories: GithubRepositories)
    case createIssue(repositories: GithubRepositories, parameters: Parameters)
    case comments(repositories: GithubRepositories, number: Int)
    case createComment(repositories: GithubRepositories, number: Int, parameters: Parameters)
    case user(username: String)
    case repositories(repositories: GithubRepositories)
    case nextPage(url: URL)

    public static let baseURLString = "https://api.github.com"

    public var method: HTTPMethod {
        switch self {
        case .issues, .issue,
             .comments,
             .user,
             .repositories,
             .nextPage:
            return .get
        case .createIssue,
             .createComment:
            return .post
        }
    }

    public var path: String {
        switch self {
        case .issue(let repositories, let number):
            return "\(path(repositories: repositories))/issues/\(number)"
        case .issues(let repositories),
             .createIssue(let repositories, _):
            return "\(path(repositories: repositories))/issues"
        case .comments(let repositories, let number),
             .createComment(let repositories, let number, _):
            return "\(path(repositories: repositories))/issues/\(number)/comments"
        case .user(let username):
            return "/users/\(username)"
        case .repositories(let repositories):
            return "\(path(repositories: repositories))/repos"
        case .nextPage(let url):
            return url.relativePath
        }
    }

    private func path(repositories: GithubRepositories) -> String {
        switch repositories {
        case .all:
            return ""
        case .ownedAndMember:
            return "/user"
        case .organization(let name):
            return "/orgs/\(name)"
        case .repository(let owner, let repo):
            return "/repos/\(owner)/\(repo)"
        case .users(let name):
            return "/users/\(name)"
        }
    }

    public func asURLRequest() throws -> URLRequest {
        let url = try GithubRouter.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .nextPage(let url):
            urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
        case .createIssue(_, let parameters),
             .createComment(_, _, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .issue,
             .issues,
             .comments,
             .repositories,
             .user:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            break
        }

        if let accessToken = GithubAuthentication.sharedInstance.accessToken, accessToken.isEmpty == false {
            urlRequest.setValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }
}