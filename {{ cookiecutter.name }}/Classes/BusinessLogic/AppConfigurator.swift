//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.organization_name }}. All rights reserved.
//

import Foundation
import Base{% if cookiecutter.firebase == "Yes" %}
import Firebase
{% endif %}

final class AppConfigurator {

    static func configure() {
        configureBuildAndServerConfiguration()
        configureAppVersionInfo(){% if cookiecutter.firebase == "Yes" %}
        FirebaseApp.configure(){% endif %}
    }

    private static func configureBuildAndServerConfiguration() {
        BuildConfiguration.current = buildConfiguration()
        ServerConfiguration.default = defaultServerConfiguration()
    }

    private static func configureAppVersionInfo() {
        guard let appInfo = Bundle.main.infoDictionary,
              let shortVersionString = appInfo["CFBundleShortVersionString"] as? String,
              let bundleVersion = appInfo["CFBundleVersion"] as? String else {
            return
        }
        let appVersion = "\(shortVersionString) (\(bundleVersion))"
        UserDefaults.standard.appVersion = appVersion
    }

    private static func buildConfiguration() -> BuildConfiguration {
        #if ADHOC
        return .adhoc
        #elseif APPSTORE
        return .appStore
        #else
        return .debug
        #endif
    }

    private static func defaultServerConfiguration() -> ServerConfiguration {
        #if ADHOC && DEV_SERVER
        return .development
        #elseif ADHOC && STAGING_SERVER
        return .staging
        #elseif ADHOC
        return .production
        #elseif DEBUG && PRODUCTION_SERVER
        return .production
        #elseif DEBUG && STAGING_SERVER
        return .staging
        #else
        return .development
        #endif
    }
}

private extension UserDefaults {

    var appVersion: String? {
        get {
            return string(forKey: #function)
        }
        set {
            set(newValue, forKey: #function)
        }
    }
}
