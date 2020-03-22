//
//  Group+CoreDataClass.swift
//  Netwerk
//
//  Created by James Macindoe on 22/3/20.
//  Copyright © 2020 James Macindoe. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Group)
public class Group: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
}
