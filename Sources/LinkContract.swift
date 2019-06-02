//
//  LinkContract.swift
//  Lune
//
//  Created by giiiita on 2019/06/03.
//  Copyright © 2019 giiiita. All rights reserved.
//

import Foundation

public protocol LinkContract {
    var dynamicLink: String  { get }
    var domainURIPrefix: String { get }
    var bundleId: String { get }
    var appStoreId: String { get }
    var fallbackUrl: String  { get }
    var isForcedRedirectEnabled: Bool { get }
    var socialParams: SocialContract { set get }
}
