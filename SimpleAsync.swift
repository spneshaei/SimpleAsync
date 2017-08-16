//
//  SwiftAsync.swift
//  SwiftNotif
//
//  Created by Seyyed Parsa Neshaei on 8/6/17.
//  Copyright © 2017 Seyyed Parsa Neshaei. All rights reserved.
//

import Foundation

public class SimpleAsync {
    
    /**
     Sets the quality of service.
     
     - Main Values:
     - `.default`
     - `.userInteractive` - All UI related tasks need to be assigned User Interactive.
     - `.utility` - Best for networking and file I/O.
     - `.background` - Best for tasks that don't depend on their fast execution.
     
     */
    public static let qualityOfService: DispatchQoS.QoSClass = .default
    
    /**
     Runs the specified code in async mode.
     
     - Parameters:
     - code: The block which will run in async mode.
     
     */
    public static func async(_ code: @escaping (() -> Void)) {
        DispatchQueue.global(qos: self.qualityOfService).async(execute: code)
    }
    
    /**
     Runs the specified code in sync mode.
     
     - Parameters:
     - code: The block which will run in sync mode.
     
     */
    public static func sync(_ code: @escaping (() -> Void)) {
        DispatchQueue.global(qos: self.qualityOfService).sync(execute: code)
    }
    
    /**
     Used to run a task after a specified delay. You can call the normal `async` and `main` methods on the return value of this method.
     
     - Parameters:
     - seconds: Specifies the delay for running tasks.
     
     */
    public static func after(seconds: Double) -> SimpleAsyncJob {
        return SimpleAsyncJob(delayInSeconds: seconds)
    }
    
    /**
     Runs the specified code in the main thread.
     
     - Parameters:
     - code: The block which will run in the main thread.
     
     */
    public static func main(_ code: @escaping (() -> Void)) {
        DispatchQueue.main.async(execute: code)
    }
}

/**
 The helper class for running tasks. This should not be used directly.
 */
public class SimpleAsyncJob {
    private var delayInSeconds = 0.0
    
    init(delayInSeconds: Double) {
        self.delayInSeconds = delayInSeconds
    }
    
    init() {
        
    }
    
    /**
     Used to run a task after a specified delay. You can call the normal `async` and `main` methods on the return value of this method.
     
     - Parameters:
     - seconds: Specifies the delay for running tasks.
     
     */
    public func after(seconds: Double) -> SimpleAsyncJob {
        self.delayInSeconds += seconds
        return self
    }
    
    /**
     Runs the specified code in async mode.
     
     - Parameters:
     - code: The block which will run in async mode.
     
     */
    public func async(_ code: @escaping (() -> Void)) {
        DispatchQueue.global(qos: SimpleAsync.qualityOfService).asyncAfter(deadline: .now() + self.delayInSeconds, execute: code)
    }
    
    
    /**
     Runs the specified code in the main thread.
     
     - Parameters:
     - code: The block which will run in the main thread.
     
     */
    public func main(_ code: @escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delayInSeconds, execute: code)
    }
}

/**
 Runs the specified code in async mode.
 
 - Parameters:
 - code: The block which will run in async mode.
 
 */
public func async(_ code: @escaping (() -> Void)) {
    DispatchQueue.global(qos: SimpleAsync.qualityOfService).async(execute: code)
}

/**
 Runs the specified code in sync mode.
 
 - Parameters:
 - code: The block which will run in sync mode.
 
 */
public func sync(_ code: @escaping (() -> Void)) {
    DispatchQueue.global(qos: SimpleAsync.qualityOfService).sync(execute: code)
}

/**
 Used to run a task after a specified delay. You can call the normal `async` and `main` methods on the return value of this method.
 
 - Parameters:
 - seconds: Specifies the delay for running tasks.
 
 */
public func after(seconds: Double) -> SimpleAsyncJob {
    return SimpleAsyncJob(delayInSeconds: seconds)
}

/**
 Runs the specified code in the main thread.
 
 - Parameters:
 - code: The block which will run in the main thread.
 
 */
public func main(_ code: @escaping (() -> Void)) {
    DispatchQueue.main.async(execute: code)
}

