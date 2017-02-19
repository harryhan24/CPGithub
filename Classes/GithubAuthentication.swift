//
// Created by Chope on 2017. 1. 17..
// Copyright (c) 2017 Chope. All rights reserved.
//

import Foundation

open class GithubAuthentication {
    public static let sharedInstance = GithubAuthentication()

    public var accessToken: String? {
        didSet {

        }
    }

    private init() { }
}
