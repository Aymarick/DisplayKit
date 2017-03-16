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
        bounds.size = size
    }
    
    override var frame: CGRect {
        get {
            return bounds
        }
        set { }
    }
    
    func draw() {
        SDL_SetRenderDrawColor(renderPointer, 0, 0, 0, 1)
        SDL_RenderClear(renderPointer)
        draw(renderer: renderPointer, origin: .zero)
        SDL_RenderPresent(renderPointer)
    }
    
    override var superview: View? {
        get { return self }
        set {  }
    }
    
}
