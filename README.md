# SimpleAsync
A super simple way to do async calls in Swift.

> Runs in: Swift 4 | iOS 11.0, watchOS 4.0, tvOS 11.0, macOS High Sierra (10.13)

## Why should I use SimpleAsync?

There are times when we want to do an async call as easy as possible without creating any queues first. These times we usually use `OperationQueue().addOperation` or similar calls. Also, many developers jump to the main thread as easy as using `DispatchQueue.main.async` or `OperationQueue.main.addOperation`. Writing these sentences everytime can cost you a lot of time, but SimpleAsync is going to help you a lot in this regard.

## Installation

Simply copy SimpleAsync.swift to your Xcode project. That's it!

## Usage

**Jumping to async mode**

    async {
      // That's it!
    }
    
**Jumping to main thread**

    main {
      // That's it!
    }
    
**Example**

    async {
      // Some network calls
      main {
        // Update UI
      }
    }
