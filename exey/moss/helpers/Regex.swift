//
//  Regex
//  Created by Exey Panteleev
//  Based on https://github.com/kasei/SwiftRegex/
//
import Foundation

infix operator =~ {}

func =~ (value : String, pattern : String) -> RegexMatchResult {
    var err : NSError?
    let nsstr = value as NSString // we use this to access the NSString methods like .length and .substringWithRange(NSRange)
    let options = NSRegularExpressionOptions(0)
    let re = NSRegularExpression(pattern: pattern, options: options, error: &err)
    if let e = err {
        return RegexMatchResult(items: [])
    }
    let all = NSRange(location: 0, length: nsstr.length)
    let moptions = NSMatchingOptions(0)
    var matches : [String] = []
    re?.enumerateMatchesInString(value, options: moptions, range: all, usingBlock:  {
        (result : NSTextCheckingResult!, flags : NSMatchingFlags, ptr : UnsafeMutablePointer<ObjCBool>)-> Void in
        let string = nsstr.substringWithRange(result.range)
        matches.append(string)
    })
    return RegexMatchResult(items: matches)
}

struct RegexMatchCaptureGenerator : GeneratorType {
    mutating func next() -> String? {
        if items.isEmpty { return nil }
        let ret = items[0]
        items = items[1..<items.count]
        return ret
    }
    var items: ArraySlice<String>
}

struct RegexMatchResult : SequenceType, BooleanType {
    var items: [String]
    func generate() -> RegexMatchCaptureGenerator {
        return RegexMatchCaptureGenerator(items: items[0..<items.count])
    }
    var boolValue: Bool {
        return items.count > 0
    }
    subscript (i: Int) -> String {
        return items[i]
    }
}
