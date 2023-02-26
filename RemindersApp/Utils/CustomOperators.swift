//
//  CustomOperators.swift
//  RemindersApp
//
//  Created by Cliff Sharp on 2/26/23.
//

import Foundation
import SwiftUI

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
  Binding(
    get: { lhs.wrappedValue ?? rhs },
    set: { lhs.wrappedValue = $0 }
  )
}
