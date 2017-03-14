//
//  Application.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation
import CSDL2

class Application {
    
    var running = true
    var windows = [Window]()
    
    init?() {
        if SDL_Init(UInt32(SDL_INIT_VIDEO)) == -1 {
            print("Error while initialzing SDL")
            return nil
        }
    }
    
    func add(window: Window) {
        windows.append(window)
    }
    
    func start() -> Int {
        
        while running {
            let eventPointer = UnsafeMutablePointer<SDL_Event>.allocate(capacity: 1)
            while SDL_PollEvent(eventPointer) == 1 {
                let event : SDL_Event = eventPointer.pointee
                switch SDL_EventType(rawValue:event.type) {
                case SDL_FINGERUP:
                    break
                case SDL_MOUSEBUTTONDOWN:
                    print("Did click at \(event.button.x)x\(event.button.y)")
                    if event.button.clicks == 2 {
                        running = false
                    }
                default:
                    break
                }
                
                
            }
            sleep(ms: 10)
        }
        
        SDL_Quit()
        return 0
    }
    
}
