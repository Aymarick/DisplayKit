//
//  Utils.swift
//  DisplayKit
//
//  Created by Aymeric De Abreu on 14/03/2017.
//
//

import Foundation

func sleep(ms: Int) {
    let total = ms * 1000
    usleep(UInt32(total))
}
