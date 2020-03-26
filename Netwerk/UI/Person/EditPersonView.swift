//
//  EditPersonView.swift
//  Netwerk
//
//  Created by James Macindoe on 23/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct EditPersonView: View {
    @ObservedObject var personState: EditPersonState
    let person: Person

    init(person: Person, _ appState: AppState) {
        self.person = person
        self.personState = EditPersonState(person, appState)
    }

    var body: some View {
        PersonView(name: personState.nameBinding,
                   groupIndex: personState.groupIndexBinding,
                   notes: personState.notesBinding)
    }
}

struct EditPersonView_Previews: PreviewProvider {
    static var previews: some View {
        EditPersonView(person: Person(id: UUID(), name: "Name", notes: "Notes"), AppState())
    }
}
