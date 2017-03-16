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
    
    var superview: View?
    var subviews = [View]()
    
    var bounds: CGRect = .zero
    var center: CGPoint = .zero
    
    var clipToBounds = false
    
    var cornerRadius: Float?

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
    
    func removeFromSuperview()
    {
        if let superview = superview {
//            superview.subviews.remove
        }
    }
    
    func addSubview(_ view: View) {
        view.removeFromSuperview()
        subviews.append(view)
        view.superview = self
    }
    
    
    func draw(renderer: OpaquePointer, origin: CGPoint)
    {
        if let _ = superview {
            var localFrame = frame
            localFrame.origin.x += origin.x
            localFrame.origin.y += origin.y
            var rect = localFrame.pointer
            
//            SDL_RenderSetViewport(renderer, &rect)
            if let color = backgroundColor {
                if let cRadius = cornerRadius {
                    roundedBoxColor(renderer, Int16(localFrame.origin.x + localFrame.width), Int16(localFrame.origin.y), Int16(localFrame.origin.x), Int16(localFrame.origin.y + localFrame.height), Int16(cRadius), color.uint32)
                }
                else {
                    boxColor(renderer, Int16(localFrame.origin.x + localFrame.width), Int16(localFrame.origin.y), Int16(localFrame.origin.x), Int16(localFrame.origin.y + localFrame.height), color.uint32)
                }
            }
            var nextOrigin = origin
//            nextOrigin.x += localFrame.origin.x
//            nextOrigin.y += localFrame.origin.y
            subviews.forEach({
                $0.draw(renderer: renderer, origin: localFrame.origin)
//                SDL_RenderSetViewport(renderer, &rect)
            })
        }
        
    }
}

extension View : Equatable {
    static func ==(lhs: View, rhs: View) -> Bool {
        return false
    }
}
