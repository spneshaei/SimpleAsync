//
//  SwiftAsync.swift
//  SwiftNotif
//
//  Created by Seyyed Parsa Neshaei on 8/6/17.
//  Copyright © 2017 Seyyed Parsa Neshaei. All rights reserved.
//

import Foundation

/**
 Runs the specified code in async mode.
 
 - Parameters:
 - code: The block which will run in async mode.
 
 */
public func async(_ code: @escaping (() -> Void)) {
    OperationQueue().addOperation(code)
}

/**
 Runs the specified code in the main thread.
 
 - Parameters:
 - code: The block which will run in the main thread.
 
 */
public func main(_ code: @escaping (() -> Void)) {
    OperationQueue.main.addOperation(code)
}
