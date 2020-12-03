//
//  Copyright © 2018 Rosberry. All rights reserved.
//

import Deboogger
import Fingertips

/// [Deboogger](https://github.com/Rosberry/Deboogger) plugin that is used to visualize
/// all the touches and gestures via [Fingertips](https://github.com/mapbox/Fingertips)

public final class FingertipsDebooggerPlugin: SwitchPlugin {

    private weak var window: MBFingerTipWindow?

    public init(window: MBFingerTipWindow?) {
        self.window = window
        window?.alwaysShowTouches = isFingertipsEnabled
    }

    private var isFingertipsEnabled: Bool {
        get {
            //Override to return value from the storage (for example UserDefaults)
            return UserDefaults.standard.bool(forKey: #function)
        }
        set {
            //Override to update value in storage
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }

    // MARK: - SwitchPlugin

    public let title: NSAttributedString = .init(string: "Fingertips enabled")

    public var isOn: Bool {
        return isFingertipsEnabled
    }

    public func switchStateChanged(_ sender: UISwitch) {
        isFingertipsEnabled = sender.isOn
        window?.alwaysShowTouches = sender.isOn
    }
}
