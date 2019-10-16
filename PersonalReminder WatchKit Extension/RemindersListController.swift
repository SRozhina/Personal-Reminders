import WatchKit
import Foundation

protocol IRemindersListView: class {
    func setReminders(_ reminders: [ReminderViewModel])
    func showDetails(for reminder: Reminder)
}

class RemindersListController: WKInterfaceController {
    @IBOutlet private weak var remindersTable: WKInterfaceTable!
    @IBOutlet private weak var addButton: WKInterfaceButton!
    
    private var reminders: [ReminderViewModel] = []
    
    var presenter: IReminderListPresenter!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let presenter = ReminderListPresenter()
        self.presenter = presenter
        presenter.view = self
        
        presenter.setup()
        
        setTitle("Reminders")
        setupTable()
    }
    
    private func setupTable() {
        remindersTable.setNumberOfRows(reminders.count, withRowType: "ReminderRow")
        
        for index in 0..<reminders.count {
            guard let row = remindersTable.rowController(at: index) as? ReminderRowController else { continue }
            row.setup(with: reminders[index])
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension RemindersListController {
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let reminder = reminders[rowIndex]
        presenter.didSelect(reminder: reminder)
    }
}

extension RemindersListController: IRemindersListView {
    func setReminders(_ reminders: [ReminderViewModel]) {
        self.reminders = reminders
        setupTable()
    }
    
    func showDetails(for reminder: Reminder) {
        pushController(withName: "ReminderDetails", context: reminder)
    }
}

protocol IReminderListPresenter {
    func setup()
    func didSelect(reminder: ReminderViewModel)
}

class ReminderListPresenter: IReminderListPresenter {
    weak var view: IRemindersListView!
    
    private var reminders: [Reminder] = []
    
    func setup() {
        reminders = [
            Reminder(id: "1",
                     name: "Drink Water",
                     isOn: true,
                     repeatDays: [.monday, .wednesday, .friday],
                     startTime: 10 * 60 * 60,
                     endTime: 21 * 60 *  60,
                     timeInterval: 20 * 60),
            Reminder(id: "1",
                     name: "Drink Water",
                     isOn: true,
                     repeatDays: [.monday, .wednesday, .friday],
                     startTime: 10 * 60 * 60,
                     endTime: 21 * 60 *  60,
                     timeInterval: 20 * 60),
            Reminder(id: "1",
                     name: "Drink Water",
                     isOn: true,
                     repeatDays: [.monday, .wednesday, .friday],
                     startTime: 10 * 60 * 60,
                     endTime: 21 * 60 *  60,
                     timeInterval: 20 * 60),
            Reminder(id: "1",
                     name: "Drink Water",
                     isOn: true,
                     repeatDays: [.monday, .wednesday, .friday],
                     startTime: 10 * 60 * 60,
                     endTime: 21 * 60 *  60,
                     timeInterval: 20 * 60),
            Reminder(id: "1",
                     name: "Drink Water",
                     isOn: true,
                     repeatDays: [.monday, .wednesday, .friday],
                     startTime: 10 * 60 * 60,
                     endTime: 21 * 60 *  60,
                     timeInterval: 20 * 60),
        ]
        
        let viewModels = reminders.map(makeViewModel)
        view.setReminders(viewModels)
    }
    
    func didSelect(reminder: ReminderViewModel) {
        guard let selectedReminder = reminders.first(where: { $0.id == reminder.id }) else { return }
        view.showDetails(for: selectedReminder)
    }
    
    private func makeViewModel(from reminder: Reminder) -> ReminderViewModel {
        return ReminderViewModel(id: reminder.id,
                                 name: reminder.name,
                                 isOn: reminder.isOn,
                                 description: "Mo, We, Fr 10:00 - 21:00") //TODO make date and time formatting
    }
}
