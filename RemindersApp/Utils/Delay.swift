//
//  Delay.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/28/23.
//

import Foundation

class Delay {
  
  private var seconds : Double
  var workItem: DispatchWorkItem?
  
  init(seconds: Double = 2.0) {
    self.seconds = seconds
  }
  
  func performWork(_ work: @escaping () -> Void) {
    
    workItem = DispatchWorkItem(block: {
      work()
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem!)  // already created woekItem above so ! is oK
  }
  
  func cancel() {
    workItem?.cancel()
  }
}
