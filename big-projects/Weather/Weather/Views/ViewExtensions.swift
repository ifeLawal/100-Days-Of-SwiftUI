//
//  ViewExtensions.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/6/24.
//

import Foundation
import _MapKit_SwiftUI

struct AnyMapAnnotationProtocol: MapAnnotationProtocol {
  let _annotationData: _MapAnnotationData
  let value: Any

  init<WrappedType: MapAnnotationProtocol>(_ value: WrappedType) {
    self.value = value
    _annotationData = value._annotationData
  }
}
