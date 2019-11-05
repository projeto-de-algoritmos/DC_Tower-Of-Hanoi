//
//  Disk.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 02/11/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import SpriteKit

class DiskNode: SKSpriteNode {

    let type: Int

    init(type: Int) {

        self.type = type
        let texture = SKTexture(imageNamed: "disk")

        super.init(texture: texture, color: .clear, size: .zero)
        color = color(for: type)
        size = size(for: type)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func color(for type: Int) -> UIColor {
        switch type {
            case 0:
                return .green
            case 1:
                return .blue
            case 2:
                return .red
            default:
                return .magenta
        }
    }
    
    func moveTo(tower: TowerNode) {
        if let topDiskPosition = tower.disks.peek()?.position {
            self.position = CGPoint(x: topDiskPosition.x,
                                    y: topDiskPosition.y + self.size.height)
        } else {
            self.position = CGPoint(x: tower.position.x,
                                    y: tower.frame.minY + self.size.height)
        }
    }

    func size(for type: Int) -> CGSize {
        return CGSize(width: 50 + 10*type, height: 15)
    }

}
