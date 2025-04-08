import UIKit

class FourthScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Четвертый экран"

        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Вернуться на главный", for: .normal)
        nextButton.addTarget(self, action: #selector(returnToFirstScreen), for: .touchUpInside)
        nextButton.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(nextButton)
    }

    @objc private func returnToFirstScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}

