// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "WWDC",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "WWDC",
            targets: ["AppModule"],
            bundleIdentifier: "com.alvinreyvaldo.WWDC",
            teamIdentifier: "N4DH95D8BY",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .box),
            accentColor: .presetColor(.brown),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .kidsGames
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)