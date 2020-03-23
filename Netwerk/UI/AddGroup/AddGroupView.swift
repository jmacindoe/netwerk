//
//  AddGroupView.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

// TODO: ideally we'd use an alert instead of a sheet but SwiftUI alerts don't currently support TextFields
struct AddGroupView: View {

    @EnvironmentObject var state: AppState
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @Binding var createdGroupIndex: Int

    var body: some View {
        Form {
            TextField("Group name", text: $name)
            Button(action: {
                let group = Group(id: UUID(), name: self.name, members: [])
                self.state.addGroup(group)
                self.createdGroupIndex = self.state.groups.count - 1
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            }
        }
    }
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView(createdGroupIndex: Binding.constant(0))
    }
}
