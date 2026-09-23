// swift-tools-version: 6.0
import PackageDescription
let package = Package(name:"waiwai",platforms:[.iOS(.v17)],products:[.library(name:"WaiwaiAppCore",targets:["WaiwaiAppCore"])],targets:[.target(name:"WaiwaiAppCore",path:"Sources/WaiwaiAppCore"),.testTarget(name:"WaiwaiAppCoreTests",dependencies:["WaiwaiAppCore"])])
