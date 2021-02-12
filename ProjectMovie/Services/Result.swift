//
//  Result.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
