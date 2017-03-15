//
//  Color.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation

class Color {
    
    var r:UInt8 = 0
    var g:UInt8 = 0
    var b:UInt8 = 0
    var a:UInt8 = 0
    
    init(r: UInt8, g: UInt8, b:UInt8, a: UInt8 = 255)
    {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    var uint32 : UInt32 {
        
        return UInt32(r) |
            UInt32(g) << 8 |
            UInt32(b) << 16 |
            UInt32(a) << 24
    }
    
    static var red: Color {
        return Color(r: 255, g: 0, b: 0)
    }
    
    static var blue: Color {
        return Color(r: 0, g: 0, b: 255)
    }
    
    static var green: Color {
        return Color(r: 0, g: 255, b: 0)
    }
    
}
