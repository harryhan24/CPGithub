//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import Alamofire

open class IssueAPI: PaginationAPI {
    @discardableResult
    public func issues(success: (([Issue])->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return load(router: .issues(repositories: repositories), success: success, failure: failure)
    }

    @discardableResult
    public func issue(number: Int, success: ((Issue)->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return item(router: .issue(repositories: repositories, number: number), success: success, failure: failure)
    }

    @discardableResult
    public func create(title: String, body: String, success: ((Issue)->Void)?, failure: ((Error)->Void)?) -> DataRequest? {
        return createItem(router: .createIssue(repositories: repositories, parameters: [
                "title": title,
                "body": body
        ]), success: success, failure: failure)
    }
}
