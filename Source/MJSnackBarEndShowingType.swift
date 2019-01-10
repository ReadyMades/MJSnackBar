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
    @objc static let Timer = 0
    @objc static let Overriden = 1
    @objc static let User = 2
}
