import PackageDescription

let package = Package(
    name: "SocialMilkServer",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-SQLite.git", majorVersion: 2, minor: 0),
    ]
)
