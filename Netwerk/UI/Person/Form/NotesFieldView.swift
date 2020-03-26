//
//  NotesFieldView.swift
//  Netwerk
//
//  Created by James Macindoe on 26/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import SwiftUI

struct NotesFieldView: View {
    let notes: Binding<String>

    var body: some View {
        HStack {
            Text("Notes")
            TextField("What a cool guy!", text: self.notes)
            // TODO: this currently has no effect so there is no way to create a multiline TextField in SwiftUI (except wrapping a UITextView)
            .lineLimit(nil)
        }
    }
}

struct NotesFieldView_Previews: PreviewProvider {
    static var previews: some View {
        NotesFieldView(notes: Binding.constant("Notes..."))
    }
}
