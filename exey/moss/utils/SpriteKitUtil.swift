//
//  SpriteKitUtil
//  Created by Exey Panteleev on 22/08/14.
//

import Foundation
import SpriteKit

public struct SpriteKitUtil {
    
    static public func addNodeFromImage(parent:SKNode, image:UIImage, x:Int, y:Int, userInteractionEnabled:Bool = false) -> SKSpriteNode{
        let texture:SKTexture = SKTexture(image: image)
        let sprite:SKSpriteNode = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x: x, y: y)
        sprite.userInteractionEnabled = userInteractionEnabled
        parent.addChild(sprite)
        return sprite
    }
    
}