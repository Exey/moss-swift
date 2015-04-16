//
//  EventUtil
//  Created by Exey Panteleev on 08/08/14.
//

import Foundation
import NotificationCenter

public struct EventUtil {
    
    static public func add(target:AnyObject?, handlerName:Selector, eventName:String!, object:AnyObject!) {
        NSNotificationCenter.defaultCenter().addObserver(target!, selector: handlerName, name: eventName, object: object)
    }
    
    static public func remove(target:AnyObject, eventName:String!, object:AnyObject!) {
        NSNotificationCenter.defaultCenter().removeObserver(target, name: eventName!, object: object)
    }
    
    static public func dispatch(eventName:String, object:AnyObject!, userData:[NSObject : AnyObject]!) {
        NSNotificationCenter.defaultCenter().postNotificationName(eventName, object: object, userInfo: userData)
    }
    
    static public func redispatch(notification:NSNotification) {
        NSNotificationCenter.defaultCenter().postNotification(notification)
    }
    
}