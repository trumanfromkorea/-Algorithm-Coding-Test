import Foundation

let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]

if let starPath = imagePaths["star"] {
    print("The star image is at '\(starPath)'")
} else {
    print("Couldn't find the star image")
}

if imagePaths["star"]?.hasSuffix(".png") == true {
    print("The star image is in PNG format")
}

let defaultImagePath = "/images/default.png"
let heartPath = imagePaths["heart"] ?? defaultImagePath
print(heartPath)

let isPNG = imagePaths["star"]!.hasSuffix(".png")
print(isPNG)
