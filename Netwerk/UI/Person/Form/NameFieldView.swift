//
//  NameFieldView.swift
//  Netwerk
//
//  Created by James Macindoe on 26/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct NameFieldView: View {
    let name: Binding<String>

    var body: some View {
        HStack {
            Text("Name")
            TextField("John Smith", text: self.name)
        }
    }
}

struct NameFieldView_Previews: PreviewProvider {
    static var previews: some View {
        NameFieldView(name: Binding.constant("Name"))
    }
}
