import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen

        let button = UIButton(type: .system)
        button.setTitle("Dismiss экран", for: .normal)
        button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(button)
    }

    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}
