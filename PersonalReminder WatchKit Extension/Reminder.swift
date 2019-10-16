import Foundation

class Reminder {
    enum DayOfWeek {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    var id: String
    var name: String
    var isOn: Bool
    var repeatDays: [DayOfWeek]
    var startTime: TimeInterval
    var endTime: TimeInterval
    var timeInterval: TimeInterval
    
    init(id: String,
         name: String,
         isOn: Bool,
         repeatDays: [DayOfWeek],
         startTime: TimeInterval,
         endTime: TimeInterval,
         timeInterval: TimeInterval) {
        self.id = id
        self.name = name
        self.isOn = isOn
        self.repeatDays = repeatDays
        self.startTime = startTime
        self.endTime = endTime
        self.timeInterval = timeInterval
    }
}

struct ReminderViewModel {
    var id: String
    let name: String
    let isOn: Bool
    let description: String
}
