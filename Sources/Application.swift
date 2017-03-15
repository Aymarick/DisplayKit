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
    let framerate = UInt32(60)
    
    let framerateManagerPointer = UnsafeMutablePointer<FPSmanager>.allocate(capacity: 1)
    
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
        
        SDL_initFramerate(framerateManagerPointer)
        SDL_setFramerate(framerateManagerPointer, framerate)
        
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
            
            windows.first?.draw()
            SDL_framerateDelay(framerateManagerPointer)
            
        }
        
        SDL_Quit()
        return 0
    }
    
}
