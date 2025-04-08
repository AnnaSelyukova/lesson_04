import UIKit

// MARK: - Вторая вкладка (present/dismiss)

class SecondTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Вторая вкладка"

        let button = UIButton(type: .system)
        button.setTitle("Present экран", for: .normal)
        button.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(button)
    }

    @objc private func presentModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .fullScreen
        present(modalVC, animated: true)
    }
}
