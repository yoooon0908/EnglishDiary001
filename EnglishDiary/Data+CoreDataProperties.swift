//
//  Data+CoreDataProperties.swift
//  EnglishDiary
//
//  Created by 三浦宏予 on 2016/02/21.
//  Copyright © 2016年 Hiroyo Miura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Data {

    @NSManaged var title: String?
    @NSManaged var content: String?
    @NSManaged var photo: String?
    @NSManaged var date: NSTimeInterval

}
