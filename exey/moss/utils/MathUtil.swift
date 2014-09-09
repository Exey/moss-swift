//
//  MathUtil
//  Created by Exey Panteleev
//

import Foundation

public struct MathUtil {

    static public let π =  Double(M_PI)

    /**radians to degrees*/
    static public func toRadians(degrees:Double) -> Double {
        var deg = degrees as Double
        return π/180.0*deg
    }

    /**degrees to radians*/
    static public func toDegrees(radians:Double) -> Double {
        return 180/π*Double(radians)
    }
    
    static public func randInRange(range: Range<Int>) -> Int {
        // arc4random_uniform(_: UInt32) returns UInt32, so it needs explicit type conversion to Int
        // note that the random number is unsigned so we don't have to worry that the modulo
        // operation can have a negative output
        return  Int(arc4random_uniform(UInt32(range.endIndex + 1 - range.startIndex))) + range.startIndex
    }
}