//
//  Lune.swift
//  Lune
//
//  Created by giiiita on 2019/06/03.
//  Copyright © 2019 giiiita. All rights reserved.
//

import Foundation
import FirebaseDynamicLinks

public class Lune {

    public static let shared: Lune = Lune()
    
    typealias CompletionHandler = (_ shortLink:URL?,_ longLink:URL?, _ error: Error?) -> Void
    
    public func build(
        linkParams: LinkContract,
        urlParams: [String: String],
        _ completionHandler:@escaping CompletionHandler) {
        
        guard let link = URL(string: linkParams.dynamicLink + setUrlParams(params: urlParams)) else { return }
        
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: linkParams.domainURIPrefix)
        let iOSParameters = DynamicLinkIOSParameters(bundleID: linkParams.bundleId)
        iOSParameters.appStoreID = linkParams.appStoreId
        linkBuilder?.iOSParameters = iOSParameters
        
        let otherPlatformParameters = DynamicLinkOtherPlatformParameters()
        otherPlatformParameters.fallbackUrl = URL(string: linkParams.fallbackUrl)
        linkBuilder?.otherPlatformParameters = otherPlatformParameters
        
        let socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
        socialMetaTagParameters.title = linkParams.socialParams.title
        socialMetaTagParameters.descriptionText = linkParams.socialParams.description
        socialMetaTagParameters.imageURL = linkParams.socialParams.imageURL
        linkBuilder?.socialMetaTagParameters = socialMetaTagParameters
        
        let navigationInfoParameters = DynamicLinkNavigationInfoParameters()
        navigationInfoParameters.isForcedRedirectEnabled = linkParams.isForcedRedirectEnabled
        linkBuilder?.navigationInfoParameters = navigationInfoParameters
        
        guard let longLink: URL = linkBuilder?.url else { return }
        
        let options = DynamicLinkComponentsOptions()
        options.pathLength = .short
        linkBuilder?.options = options
        
        linkBuilder?.shorten { (shortLink, warnings, error) in
            if let error = error {
                completionHandler(nil, nil, error)
            }
            completionHandler(shortLink,longLink, nil)
        }
    }
    
    private func setUrlParams(params:[String:String]) -> String {
        var link:String = "?"
        params.map {
            link.append($0.key + "=" + $0.value)
            link.append((Array(params.keys).last == $0.key ? "" : "&"))
        }
        return link
    }
    
}
