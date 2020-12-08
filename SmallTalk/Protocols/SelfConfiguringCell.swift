//
//  SelfConfigurationCell.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 07.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}

