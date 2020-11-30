//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit
import GenericModule

final class AppCoordinator: Coordinator<UINavigationController> {

    var window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        super.init(rootViewController: UINavigationController())
    }

    func start(launchOptions: LaunchOptions?) {
        let module = MainModule()
        module.output = self
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        rootViewController.pushViewController(module.viewController, animated: false)
    }
}

extension AppCoordinator: MainModuleOutput {
    func mainModuleClosed(_ moduleInput: MainModuleInput) {}
}
