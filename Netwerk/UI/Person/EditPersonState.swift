//
//  EditPersonState.swift
//  Netwerk
//
//  Created by James Macindoe on 24/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import Foundation
import SwiftUI

class EditPersonState: ObservableObject {
    @Published var name: String
    @Published var groupIndex: Int
    @Published var notes: String
    let appState: AppState
    let personId: Person.ID

    init(_ person: Person, _ appState: AppState) {
        self.name = person.name
        self.groupIndex = appState.groups.firstIndex(where: { group in group.members.contains(where: { $0.id == person.id }) })!
        self.notes = person.notes
        self.appState = appState
        self.personId = person.id
    }

    var nameBinding: Binding<String> {
        Binding(get: { [weak self] in self?.name ?? "" },
                set: { [weak self] name in
                    self?.updateAppStateName(to: name)
                    self?.name = name
        })
    }

    var notesBinding: Binding<String> {
        Binding(get: { [weak self] in self?.notes ?? "" },
                set: { [weak self] notes in
                    self?.updateAppStateNotes(to: notes)
                    self?.notes = notes
        })
    }

    var groupIndexBinding: Binding<Int> {
        Binding(get: { [weak self] in self?.groupIndex ?? 0 },
                set: { [weak self] index in
                    self?.moveToNewGroupIndex(index)
                    self?.groupIndex = index
        })
    }

    private func updateAppStateName(to name: String) {
        self.appState.groups[self.groupIndex].members[self.indexInCurrentGroup()].name = name
    }

    private func updateAppStateNotes(to notes: String) {
        self.appState.groups[self.groupIndex].members[self.indexInCurrentGroup()].notes = notes
    }

    private func indexInCurrentGroup() -> Int {
        let groupMembers = self.appState.groups[self.groupIndex].members
        return groupMembers.firstIndex(where: { $0.id == self.personId })!
    }

    private func moveToNewGroupIndex(_ index: Int) {
        let person = self.appState.groups[self.groupIndex].members[self.indexInCurrentGroup()]
        self.appState.groups[self.groupIndex].members.remove(at: self.indexInCurrentGroup())
        self.appState.groups[index].members.append(person)
    }
}
