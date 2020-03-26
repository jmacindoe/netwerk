//
//  EditorState.swift
//  Netwerk
//
//  Created by James Macindoe on 24/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//

import Foundation
import SwiftUI

class AddPersonState: ObservableObject {
    @Published var name: String = ""
    @Published var groupIndex: Int = 0
    @Published var notes: String = ""

    var nameBinding: Binding<String> {
        Binding(get: { [weak self] in self?.name ?? "" },
                set: { [weak self] in self?.name = $0 })
    }

    var groupIndexBinding: Binding<Int> {
        Binding(get: { [weak self] in self?.groupIndex ?? 0 },
                set: { [weak self] in self?.groupIndex = $0 })
    }

    var notesBinding: Binding<String> {
        Binding(get: { [weak self] in self?.notes ?? "" },
                set: { [weak self] in self?.notes = $0 })
    }
}
