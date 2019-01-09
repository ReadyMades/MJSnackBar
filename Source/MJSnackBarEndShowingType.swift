//
//  MJSnackBarEndShowingType.swift
//  MJSnackBar
//
//  Created by dev on 09/01/2019.
//  Copyright © 2019 Shakarang. All rights reserved.
//

import UIKit

@objc class MJSnackBarEndShowingType: NSObject {
    /// Enum to know why SnackBar disappeared : due to Timer or User action
    ///
    /// - timer: The timer ended, normal behaviour
    /// - user: The user pressed the undo button. You have to handle it
    static let Timer = 0
    static let Overriden = 1
    static let User = 2
}
