import PackageDescription

let package = Package(
    name: "DisplayKit",
    dependencies: [
		.Package(url: "https://github.com/Aymarick/CSDL2.git", majorVersion: 1)
    ]
)
