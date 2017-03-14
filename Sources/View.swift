//
//  View.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation
import CSDL2

class View {
    
    var subviews = [View]()
    
    var bounds: CGRect = .zero
    var center: CGPoint = .zero
    
    var backgroundColor: Color?
    
    var frame: CGRect {
        set {
            center = CGPoint(x: newValue.origin.x + newValue.width/2.0, y: newValue.origin.y + newValue.width/2.0)
            bounds.size = newValue.size
        }
        get {
            return CGRect(origin: CGPoint(x: center.x - (bounds.width / 2.0), y: center.y - (bounds.height / 2.0)), size: bounds.size)
        }
    }
    
    init(withFrame frame:CGRect)
    {
        self.frame = frame
    }
    
    init() { }
    
    func draw()
    {
        
    }
}
