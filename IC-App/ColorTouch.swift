//
//  ColorTouch.swift
//  IC-App
//
//  Created by Mike Dongen van on 25/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

//extension CALayer {
//
//    func colorOfPoint(point:CGPoint) -> CGColor {
//
//        var pixel: [CUnsignedChar] = [0, 0, 0, 0]
//
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
//
//        let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
//
//        context!.translateBy(x: -point.x, y: -point.y)
//
//        self.render(in: context!)
//
//        let red: CGFloat   = CGFloat(pixel[0]) / 255.0
//        let green: CGFloat = CGFloat(pixel[1]) / 255.0
//        let blue: CGFloat  = CGFloat(pixel[2]) / 255.0
//        let alpha: CGFloat = CGFloat(pixel[3]) / 255.0
//
//        let color = UIColor(red:red, green: green, blue:blue, alpha:alpha)
//
//        return color.cgColor
//    }
//}
