//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.organization_name }}. All rights reserved.
//

import UIKit
import Framezilla

final class ViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello!"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.configureFrame { maker in
            maker.sizeToFit().center()
        }
    }
}
