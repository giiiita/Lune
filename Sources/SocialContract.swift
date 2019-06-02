//
//  SocialContract.swift
//  Lune
//
//  Created by giiiita on 2019/06/03.
//  Copyright © 2019 giiiita. All rights reserved.
//

import Foundation

public protocol SocialContract {
    var title: String { set get }
    var description: String { set get }
    var imageURL: URL { set get }
}
