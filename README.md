# Lune
Dynamic Link Wrapper Library for iOS

[![Version](https://img.shields.io/cocoapods/v/Lune.svg?style=flat)](http://cocoapods.org/pods/Lune)
[![License](https://img.shields.io/cocoapods/l/Lune.svg?style=flat)](http://cocoapods.org/pods/Lune)
[![Platform](https://img.shields.io/cocoapods/p/Lune.svg?style=flat)](http://cocoapods.org/pods/Lune)

## Usage
### There's only three steps to using Lune:


#### ⅰ
Create a structure and make it conform to `LinkContract`.

This structure writes the basic settings of dynamicLink.


If you do not know what to set, please check on the [official site](https://firebase.google.com/docs/dynamic-links/ios/create)
```swift
struct LinkConfig: LinkContract {

    var dynamicLink: String = ""

    var domainURIPrefix: String = ""

    var bundleId: String = ""

    var appStoreId: String = ""

    var fallbackUrl: String = ""

    var isForcedRedirectEnabled: Bool = false

    var socialParams: SocialContract

    init(socialParams: SocialContract) {
        self.socialParams = socialParams
    }

}
```

#### ⅱ
Create a structure and make it conform to SocialContract.

This structure writes about preview settings.

```swift
struct SocialParams: SocialContract {

    var title: String

    var description: String

    var imageURL: URL
    
    init(title: String, description: String, imageURL: URL) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}
```

#### ⅲ

The callback will return short url, long url and error.
```swift
let social: SocialContract = SocialParams(
    title: self.product.title,
    description: self.product.description,
    imageURL: self.product.thumbnail.downloadURL
    )
        
 let link: LinkContract = LinkConfig(socialParams: social)
 let params: [String: String] = ["productId": self.product.id]

 Lune.shared.build(linkParams: link, urlParams: params) { (s, l, e) in
 }
```

## Requirements

## Installation

Lune is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Lune'
```