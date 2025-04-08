import UIKit

class ThirdScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Третий экран"

        let button = UIButton(type: .system)
        button.setTitle("Перейти на четвертый экран", for: .normal)
        button.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(button)
    }

    @objc private func goToNextScreen() {
        let fourthVC = FourthScreenViewController()
        navigationController?.pushViewController(fourthVC, animated: true)
    }
}

