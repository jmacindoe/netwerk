//
//  GroupListView.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI
import CoreData

struct GroupListView: View {

    @EnvironmentObject var state: AppState

    var body: some View {
        NavigationView {
            List {
                ForEach(self.state.groups) { group in
                    Section(header: Text(group.name)) {
                        ForEach(group.members) { person in
                            Text(person.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Groups")
            .navigationBarItems(trailing:
                Button(action: {
                    let person = Person(id: UUID(), name: "P1", notes: "n1")
                    let group = Group(id: UUID(), name: "Work", members: [])
                    self.state.addGroup(group)
                    self.state.addPerson(person, into: group.id)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView().environmentObject(AppState())
    }
}
