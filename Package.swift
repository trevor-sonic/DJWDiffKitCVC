// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJWDiffKitCVC",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .tvOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DJWDiffKitCVC",
            targets: ["DJWDiffKitCVC"]),
    ],
    dependencies: [
        /// private
        .package(url: "https://github.com/trevor-sonic/DJWCommon.git", from: "1.0.18"),
        .package(url: "https://github.com/trevor-sonic/DJWUIExtensions.git", from: "1.0.18"),
        .package(url: "https://github.com/trevor-sonic/DJWVTExtensions.git", from: "1.0.18"),
        
        .package(url: "https://github.com/trevor-sonic/DJWUIBuilder.git", from: "1.0.18"),
        .package(url: "https://github.com/trevor-sonic/DJWBaseVC.git", from: "1.0.18"),
        .package(url: "https://github.com/trevor-sonic/DJWBindableVar.git", from: "1.0.18"),
        .package(url: "https://github.com/trevor-sonic/DJWBuilderNS.git", from: "1.0.18"),

        
        
        ///public
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        .package(url: "https://github.com/ra1028/DifferenceKit.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DJWDiffKitCVC",
            dependencies: [
                ///private
                "DJWCommon",
                "DJWUIExtensions",
                "DJWVTExtensions",
                
                "DJWUIBuilder",
                "DJWBaseVC",
                "DJWBindableVar",
                "DJWBuilderNS",
   
    
                
                ///public
                "SnapKit",
                "DifferenceKit",
            
            ]),
        .testTarget(
            name: "DJWDiffKitCVCTests",
            dependencies: ["DJWDiffKitCVC"]),
    ]
)
