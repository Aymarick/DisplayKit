//
//  Window.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation
import CSDL2

class Window : View {
    
    let windowPointer: OpaquePointer
    let renderPointer: OpaquePointer

    init(withTitle title:String, size: CGSize = CGSize(width: 300, height: 400),
         andPosition position: CGPoint = CGPoint(x: Int(SDL_WINDOWPOS_CENTERED_MASK), y:Int(SDL_WINDOWPOS_CENTERED_MASK))) {
        windowPointer = SDL_CreateWindow(title, Int32(position.x), Int32(position.y), Int32(size.width), Int32(size.height), 0)
        renderPointer = SDL_CreateRenderer(windowPointer, -1, SDL_RENDERER_ACCELERATED.rawValue)
        super.init()
        var xPosition: Int32 = 0
        var yPosition: Int32 = 0
        SDL_GetWindowPosition(windowPointer, &xPosition, &yPosition)
        center = CGPoint(x: Int(xPosition), y: Int(yPosition))
        bounds.size = size
    }
    
}
