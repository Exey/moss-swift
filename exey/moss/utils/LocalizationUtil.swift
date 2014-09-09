//
//  LocalizationUtil
//  Created by Exey on 27/08/14.
//

import Foundation

public struct LocalizationUtil {

    static func numericDeclension(number:Int, nominative:String, genitive:String, plural:String) -> String {
        let lastDigit:Int = number % 10
        if(String(number) =~ "1.$") {
            return plural
        } else if(lastDigit == 1) {
            return nominative
        } else if(lastDigit > 0 && lastDigit < 5){
            return genitive }
        else {
            return plural
        }
    }
    
}