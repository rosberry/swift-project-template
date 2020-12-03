//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.organization_name }}. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var appCoordinator: AppCoordinator = .init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        AppConfigurator.configure()
        appCoordinator.start(launchOptions: launchOptions)
        return true
    }
}
