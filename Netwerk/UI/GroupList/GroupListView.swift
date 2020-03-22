//
//  GroupListView.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct GroupListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(appSampleData) { group in
                    Section(header: Text(group.name)) {
                        ForEach(group.members) { person in
                            Text(person.name)
                        }
                    }
                }
            }
        .navigationBarTitle("Groups")
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}
