//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import Alamofire


public enum GithubAPIError: Error {
    case invalidJson
}


open class GithubAPI {
    public class func initialize() {
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
    }

    public let repositories: GithubRepositories

    public init(repositories: GithubRepositories) {
        self.repositories = repositories
    }

    public func item<T: GithubData>(router: GithubRouter, success: ((T)->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return Alamofire.request(router).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any] else {
                    failure?(GithubAPIError.invalidJson)
                    return
                }
                success?(T(rawJson: json))
            case .failure(let error ):
                failure?(error)
            }
        }
    }

    public func createItem<T: GithubData>(router: GithubRouter, success: ((T)->Void)?, failure: ((Error)->Void)?) -> DataRequest? {
        guard GithubAuthentication.sharedInstance.accessToken != nil else {
            assertionFailure()
            return nil
        }
        return item(router: router, success: success, failure: failure)
    }
}
