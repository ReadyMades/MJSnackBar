//
//  MJSnackBarData.swift
//  MJSnackBar
//
//  Created by Maxime Junger on 22/01/2017.
//  Copyright © 2017 Shakarang. All rights reserved.
//

/// Data to fill the MJSnackBar

import Foundation

@objc public class MJSnackBarData: NSObject {
    
    /// Message you want to display to the user
    public var message: String
    
    /// Action message shown next to the message
    public var action: String?
    
    /// Field to help you identify what data it is
    public var ID: Int?
    
    /// Object linked to the data displayed. Only there to help you retrieving it easily.
    public var originalObject: Any?
    
    @objc public init(withIdentifier ID: Int, message: String, andActionMessage action: String, objectSaved originalObject: Any) {
        self.ID = ID
        self.message = message
        self.action = action
        self.originalObject = originalObject
    }
    
    /// Checking if two data are the same
    /// - Returns: true if they have the same content
    @objc public class func isEquals(firstData: MJSnackBarData, secondData: MJSnackBarData) -> Bool {
        if firstData.ID == secondData.ID
            && firstData.message == secondData.message
            && firstData.action == secondData.action {
            return true
        }
        return false
    }
    
}
