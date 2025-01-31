//
//  DailyScrum.swift
//  TaskAsyncLetExample
//
//  Created by Swapnil Shinde on 11/07/24.
//

import Foundation

struct DailyScrum : Identifiable, Codable {
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
    
    var id: UUID
    var title : String
    var attendees : [Attendee]
    var lengthInMinutes : Int
    
    var lengthInMinutesAsDouble: Double{
        get{
            Double(lengthInMinutes)
        }
        set{
           print(newValue)
        }
    }
    var theme : Theme
    var history : [History] = []
    
    static var emptyScrum : DailyScrum{
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
    
}

extension DailyScrum{
    struct Attendee: Identifiable, Codable {
        let id : UUID
        var name : String
        
        init(id : UUID = UUID() , name : String) {
            self.id = id
            self.name = name
        }
        
    }
    
    
}

extension DailyScrum {
    
    static let sampleData : [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        
         DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        
         DailyScrum(title: "Web Dev",
                   attendees: ["Chell", "Chris", "Cristina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
        
    ]
    
}
