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
      from: "12.0.0"
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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/line/LineAdapter-2.9.20251119.0.zip",
      checksum: "afe9e02fae4e28112c8a9f02885831a11106774d1e5bd1ab7524b3710f762eea"
    ),
    .binaryTarget(
      name: "LineSDK",
      url:
        "https://cdn.fivecdm.com/release-sdk/ios/20251119/FiveAd.framework-20251119.zip",
      checksum: "0d26ba167eea21f64fc7a1a1b4ee8d24fb2228835c3ea0a8074693eee89590e0"
    ),
  ]
)
