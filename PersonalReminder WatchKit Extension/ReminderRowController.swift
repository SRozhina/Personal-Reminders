import WatchKit

class ReminderRowController: NSObject {
    @IBOutlet private weak var reminderSwitch: WKInterfaceSwitch!
    @IBOutlet private weak var descriptionLanbel: WKInterfaceLabel!
    
    func setup(with reminder: ReminderViewModel) {
        reminderSwitch.setTitle(reminder.name)
        reminderSwitch.setOn(reminder.isOn)
        descriptionLanbel.setText(reminder.description)
    }
}
