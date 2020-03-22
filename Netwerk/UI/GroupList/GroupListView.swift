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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Group.name, ascending: true)]) var groups: FetchedResults<Group>
    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Person.group.name, ascending: true), NSSortDescriptor(keyPath: \Person.name, ascending: true)]) var people: FetchedResults<Person>

    private var sections: [ListSection] {
        self.groups.map { group in
            let members = self.people.filter { $0.group.id == group.id }
            return ListSection(group: group, members: members)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(self.sections) { section in
                    Section(header: Text(section.group.name)) {
                        ForEach(section.members) { person in
                            Text(person.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Groups")
            .navigationBarItems(trailing:
                Button(action: {
                    let group: Group
                    if (self.groups.count < 3) {
                        group = Group(context: self.managedObjectContext)
                        group.id = UUID()
                        group.name = "Group \(group.id.uuidString[group.id.uuidString.startIndex])"
                    } else {
                        group = self.groups[self.people.count % 3]
                    }

                    let person = Person(context: self.managedObjectContext)
                    person.id = UUID()
                    person.name = "\(person.id.uuidString[person.id.uuidString.startIndex])"
                    person.notes = "The note"
                    person.group = group
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

private struct ListSection {
    let group: Group
    let members: [Person]
}

extension ListSection : Identifiable {
    var id: ListSection.ID {
        self.group.id
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}
