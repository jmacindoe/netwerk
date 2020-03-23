//
//  Group.swift
//  Netwerk
//
//  Created by James Macindoe on 23/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import Foundation

struct Group: Identifiable {
    let id: UUID
    var name: String
    var members: [Person]
}
