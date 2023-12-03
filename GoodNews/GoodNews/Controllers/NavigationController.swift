//
//  NavigationController.swift
//  GoodNews
//
//  Created by Sri Hari Karthick on 18/11/23.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    // To set the status bar as light mode (white color)
    // Plist property no longer works in latest iOS version
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
