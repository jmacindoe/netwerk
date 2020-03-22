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
    @State var addPersonSheetIsShowing = false

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
                    self.addPersonSheetIsShowing.toggle()
                }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $addPersonSheetIsShowing) {
                    PersonEditorView().environmentObject(self.state)
                })
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView().environmentObject(AppState())
    }
}
