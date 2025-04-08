import UIKit

class SecondScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        title = "Второй экран"

        let button = UIButton(type: .system)
        button.setTitle("Перейти на третий экран", for: .normal)
        button.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(button)
    }

    @objc private func goToNextScreen() {
        let thirdVC = ThirdScreenViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}
