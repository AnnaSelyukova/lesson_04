import UIKit

class DataViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        label.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        title = "Экран с данными"

        label.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 50)
        view.addSubview(label)
    }
}

