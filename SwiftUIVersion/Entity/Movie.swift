//
//  Movie.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 18.02.2022.
//

import Foundation
import CoreData

public class Movie: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var information: String?
    @NSManaged public var image: Data?
    
}
