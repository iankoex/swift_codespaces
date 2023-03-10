// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ItemsServer",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.69.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.6.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.5.0"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.0"),
        .package(url: "https://github.com/iankoex/LiveKitVapor.git", from: "0.0.8"),
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "2.8.1"),
        .package(url: "https://github.com/iankoex/ItemsCore.git", from: "0.1.7")
//        .package(path: "../ItemsCore")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "LiveKitVapor", package: "LiveKitVapor"),
                .product(name: "HTMLKit", package: "HTMLKit"),
                .product(name: "ItemsCore", package: "ItemsCore")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
//      
        
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)