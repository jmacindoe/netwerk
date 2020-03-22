//
//  AppState.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var groups = [Group]()

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
