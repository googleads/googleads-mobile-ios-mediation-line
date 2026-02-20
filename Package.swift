// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "LineAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "LineAdapterTarget",
      targets: ["LineAdapterTarget", "LineSDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
  ],
  targets: [
    .target(
      name: "LineAdapterTarget",
      dependencies: [
        .target(name: "LineAdapter"),
        .target(name: "LineSDK"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "LineAdapterTarget"
    ),
    .binaryTarget(
      name: "LineAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/line/LineAdapter-3.0.0.1.zip",
      checksum: "3e86d04e8cec5f0472818012fc8f5bb0ccaa4d4b1f2290fd7c5bf1d5e0c72f39"
    ),
    .binaryTarget(
      name: "LineSDK",
      url:
        "https://cdn.fivecdm.com/release-sdk/ios/v3.0.0/FiveAd.framework.zip",
      checksum: "1d0ca55a377fd6dab304e658f48c2c72d7d620ca38cae4c4a7d8cc3ff0febc8a"
    ),
  ]
)
