//
//  FetchState.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 7/6/24.
//

import Foundation

enum FetchState<T> {
    case idle
    case loading
    case success
    case failure(Error)
}
