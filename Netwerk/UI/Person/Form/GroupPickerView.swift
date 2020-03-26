//
//  GroupPickerView.swift
//  Netwerk
//
//  Created by James Macindoe on 26/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct GroupPickerView: View {
    let groupIndex: Binding<Int>
    let groups: [Group]

    var body: some View {
        Picker(selection: self.groupIndex, label: Text("Group")) {
            ForEach(0..<self.groups.count, id: \.self) { index in
                Text(self.groups[index].name).tag(index)
            }
        }
    }
}

struct GroupPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPickerView(groupIndex: Binding.constant(0), groups: [])
    }
}
