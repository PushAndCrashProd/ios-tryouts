//
//  Strings+Extensions.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 05/12/23.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
