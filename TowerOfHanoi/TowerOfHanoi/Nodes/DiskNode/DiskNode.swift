//
//  Disk.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 02/11/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import SpriteKit

class DiskNode: SKSpriteNode {

    let type: DiskType

    init(type: DiskType) {

        self.type = type
        let texture = SKTexture(imageNamed: "disk")
        let color = self.color(for: type)
        let size = self.size(for: type)

        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func color(for type: DiskType) -> UIColor {
        switch type {
            case .disk1:
                return .green
            case .disk2:
                return .blue
            case .disk3:
                return .red
            default:
                fatalError()
        }
    }

    func size(for type: DiskType) -> CGSize {
        switch type {
            case .disk1:
                return CGSize(width: 50, height: 15)
            case .disk2:
                return CGSize(width: 60, height: 15)
            case .disk3:
                return CGSize(width: 70, height: 15)
            default:
                fatalError()
        }
    }

}
