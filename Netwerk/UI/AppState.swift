//
//  AppState.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: Move
class AppState: ObservableObject {
    @Published var groups: [Group] = sampleData
    //let editor = EditorState()

    func addGroup(_ group: Group) {
        groups.append(group)
    }

    func addPerson(_ person: Person, into groupID: Group.ID) {
        guard let groupIndex = self.groups.firstIndex(where: { $0.id == groupID }) else {
            fatalError("Group must already exist when adding a person")
        }

        groups[groupIndex].members.append(person)
    }
}

fileprivate let sampleData = [
    Group(id: UUID(),
          name: "Gym",
          members: [
            Person(id: UUID(), name: "Arnie", notes: ""),
            Person(id: UUID(), name: "Zyzz", notes: ""),
        ]
    ),
    Group(id: UUID(),
          name: "Work",
          members: [
            Person(id: UUID(), name: "Uncle Bob", notes: "i luv TDD"),
            Person(id: UUID(), name: "Aunty Alice", notes: ""),
            Person(id: UUID(), name: "Mr Gates", notes: "I swear I'm an alright guy!")
    ])
]
