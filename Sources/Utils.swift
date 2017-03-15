//
//  Utils.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation
import CSDL2

func sleep(ms: Int) {
    let total = ms * 1000
    usleep(UInt32(total))
}

extension CGRect {
    var pointer: SDL_Rect {
        return SDL_Rect(x: Int32(origin.x), y: Int32(origin.y), w: Int32(size.width), h: Int32(size.height))
    }
}
