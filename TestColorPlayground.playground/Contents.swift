//: Playground - noun: a place where people can play

import UIKit

public extension UIColor {
    public convenience init(hexString: String, alpha: Float = 1, defaultColor: UIColor = UIColor.whiteColor()) {
        var hex = hexString
        
        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1))
        }
        
        if (hex.rangeOfString("(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .RegularExpressionSearch) != nil) {
            
            // Deal with 3 character Hex strings
            if hex.characters.count == 3 {
                let redHex   = hex.substringToIndex(hex.startIndex.advancedBy(1))
                let greenHex = hex.substringWithRange(Range<String.Index>(start: hex.startIndex.advancedBy(1), end: hex.startIndex.advancedBy(2)))
                let blueHex  = hex.substringFromIndex(hex.startIndex.advancedBy(2))
                
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
            
            let startIndex = hex.startIndex
            let endIndex = hex.endIndex
            
            let redRange = Range(start: startIndex, end: startIndex.advancedBy(2))
            let greenRange = Range(start: startIndex.advancedBy(2), end: startIndex.advancedBy(4))
            let blueRange = Range(start: startIndex.advancedBy(4), end: endIndex)
            
            let redHex = hex.substringWithRange(redRange)
            let greenHex = hex.substringWithRange(greenRange)
            let blueHex = hex.substringWithRange(blueRange)
            
            let redInt = Int(redHex,radix: 16)!
            let greenInt = Int(greenHex,radix: 16)!
            let blueInt = Int(blueHex,radix: 16)!
            
            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }
        else {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            defaultColor.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            self.init(red: r, green: g, blue: b, alpha: a)
        }
    }
}


let color1 = UIColor(hexString: "#66ccff") // default alpha = 1
let color2 = UIColor(hexString: "#66ccff", alpha: 0.5) // with alpha param
let color3 = UIColor(hexString: "#error", defaultColor: UIColor.redColor()) // return default color when error.
