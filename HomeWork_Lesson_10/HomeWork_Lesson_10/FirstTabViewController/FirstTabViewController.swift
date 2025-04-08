
import UIKit

// MARK: - Первая вкладка (4 экрана с навигацией)

class FirstTabViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перейти на второй экран", for: .normal)

        return button

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Главный экран"

        view.addSubview(button)
        
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        button.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)


    }

    @objc private func goToNextScreen() {
        let secondVC = SecondScreenViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
