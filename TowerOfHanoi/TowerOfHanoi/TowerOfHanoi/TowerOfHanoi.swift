//
//  TowerOfHanoi.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 31/10/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import Foundation

class TowerOfHanoi {

    private init () { }

    static let shared = TowerOfHanoi()

    func solve(numberOfDisks: Int, from source: Tower, to destination: Tower, auxiliary tower: Tower) {

        guard numberOfDisks != 0 else { return }

        solve(numberOfDisks: numberOfDisks - 1, from: source, to: tower, auxiliary: destination)
        print("Move disk \(numberOfDisks) from \(source.rawValue) to \(destination.rawValue)")
        solve(numberOfDisks: numberOfDisks - 1, from: tower, to: destination, auxiliary: source)
    }
}
