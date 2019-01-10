//
//  MJSnackBarDelegate.swift
//  MJSnackBar
//
//  Created by Maxime Junger on 22/01/2017.
//  Copyright © 2017 Shakarang. All rights reserved.
//
import Foundation

@objc public protocol MJSnackBarDelegate {
    
    /// Action triggered when the SnackBar is shown on the view.
    ///
    /// - Parameter data: data contained in the SnackBar
    @objc func snackBarAppeared(with data: MJSnackBarData)
    
    /// Action triggered when the SnackBar is removed from the view.
    ///
    /// - Parameters:
    ///   - data: data contained in the SnackBar
    ///   - reason: why the SnackBar disappeared
    @objc func snackBarDisappeared(with data: MJSnackBarData, reason: Int)
    
    /// Action triggered when the user tapped on the SnackBar
    ///
    /// - Parameter data: data contained in the SnackBar
    @objc func snackBarActionTriggered(with data: MJSnackBarData)
}
