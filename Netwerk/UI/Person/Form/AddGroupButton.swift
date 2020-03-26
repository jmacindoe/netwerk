//
//  AddGroupButton.swift
//  Netwerk
//
//  Created by James Macindoe on 26/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct AddGroupButton: View {
    @EnvironmentObject var appState: AppState
    @State var showingAddGroupSheet = false
    let groupIndex: Binding<Int>
    
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .foregroundColor(Color.blue)
            Button(action: {
                self.showingAddGroupSheet.toggle()
            }) {
                Text("Add Group")
            }.sheet(isPresented: self.$showingAddGroupSheet) {
                AddGroupView(createdGroupIndex: self.groupIndex).environmentObject(self.appState)
            }
        }
    }
}

struct AddGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupButton(groupIndex: Binding.constant(0)).environmentObject(AppState())
    }
}
