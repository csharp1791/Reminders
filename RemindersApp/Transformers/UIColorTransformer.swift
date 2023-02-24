//
//  UIColorTransformer.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/23/23.
//

import Foundation
import UIKit

class UIColorTransformer: ValueTransformer {
  
  override func transformedValue(_ value: Any?) -> Any? {
    guard let color = value as? UIColor else { return nil }
    
    do {
      let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
      return data
    } catch {
      print("archive error \(error.localizedDescription)")
      return nil
    }
  }
  
  override func reverseTransformedValue(_ value: Any?) -> Any? {
    
    guard let data = value as? Data else { return nil }
    
    do {
      let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
      return color
    } catch {
      print("unarhive error: \(error.localizedDescription)")
      return nil
    }
  }
}
