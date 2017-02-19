//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation
import Alamofire

open class CommentAPI: PaginationAPI {
    @discardableResult
    public func comments(issueNumber: Int, success: (([Comment])->Void)?, failure: ((Error)->Void)?) -> DataRequest {
        return load(router: .comments(repositories: repositories, number: issueNumber), success: success, failure: failure)
    }

    @discardableResult
    public func create(issueNumber: Int, body: String, success: ((Issue)->Void)?, failure: ((Error)->Void)?) -> DataRequest? {
        return createItem(router: .createComment(repositories: repositories, number: issueNumber, parameters: [
                "body": body
        ]), success: success, failure: failure)
    }
}
