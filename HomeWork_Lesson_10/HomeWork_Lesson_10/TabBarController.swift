import UIKit


// MARK: - Настройка TabBarController

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        // Первая вкладка
        let firstVC = UINavigationController(rootViewController: FirstTabViewController())
        firstVC.tabBarItem = UITabBarItem(title: "Навигация", image: UIImage(systemName: "1.circle"), tag: 0)

        // Вторая вкладка
        let secondVC = SecondTabViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Present", image: UIImage(systemName: "2.circle"), tag: 1)

        // Третья вкладка
        let thirdVC = UINavigationController(rootViewController: ThirdTabViewController())
        thirdVC.tabBarItem = UITabBarItem(title: "Данные", image: UIImage(systemName: "3.circle"), tag: 2)

        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
