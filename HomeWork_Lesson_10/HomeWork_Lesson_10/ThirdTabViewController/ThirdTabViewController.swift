import UIKit


// MARK: - Третья вкладка (передача данных через init)

class ThirdTabViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Третья вкладка"

        let button = UIButton(type: .system)
        button.setTitle("Передать данные", for: .normal)
        button.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(button)
    }

    @objc private func goToNext() {
        let dataVC = DataViewController(text: "Данные переданные через init!")
        navigationController?.pushViewController(dataVC, animated: true)
    }
}
