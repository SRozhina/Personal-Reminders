import WatchKit

class RemainderDetailsController: WKInterfaceController {
    
    private var reminder: Reminder? {
        didSet {
            guard let reminder = reminder else { return }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let reminder = context as? Reminder {
          self.reminder = reminder
        }
    }
}
