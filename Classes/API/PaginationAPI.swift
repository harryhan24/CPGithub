//
// Created by Chope on 2017. 1. 19..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import Alamofire

public enum PaginationAPIError: Error {
    case notExistsNextPage
}

open class PaginationAPI: GithubAPI {
    private var nextPageUrl: String?

    @discardableResult
    public func load<T: GithubData>(router: GithubRouter, success: (([T])->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return items(router: router, success: { [weak self] (items: [T], nextPageUrl: String?) in
            self?.nextPageUrl = nextPageUrl
            success?(items)
        }, failure: failure)
    }

    @discardableResult
    public func loadNextPage<T: GithubData>(success: (([T])->Void)?, failure: ((Error)->Void)?) -> DataRequest? {
        guard let nextPageUrl = nextPageUrl, let url = URL(string: nextPageUrl) else {
            failure?(PaginationAPIError.notExistsNextPage)
            return nil
        }
        return load(router: .nextPage(url: url), success: success, failure: failure)
    }

    @discardableResult
    public func items<T: GithubData>(router: GithubRouter, success: (([T], String?)->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return Alamofire.request(router).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [[String: Any]] else {
                    failure?(GithubAPIError.invalidJson)
                    return
                }

                let items: [T] = json.map { T(rawJson: $0) }
                if let linkValue: String = response.response?.allHeaderFields["Link"] as? String {
                    //TODO: last, first, prev
                    let pattern = "<(.+)>; rel=\"next\""
                    if let regex = try? NSRegularExpression(pattern: pattern, options: []), let match: NSTextCheckingResult = regex.matches(in: linkValue, options: [], range: NSRange(location: 0, length: linkValue.characters.count)).first {
                        let range = match.rangeAt(1)
                        let nextPageUrl = (linkValue as NSString).substring(with: range)
                        success?(items, nextPageUrl)
                        return
                    }
                }
                success?(items, nil)
            case .failure(let error):
                failure?(error)
            }
        }
    }
}
