//
//  ViewController.swift
//  lesson_09_HomeWork_task_01
//
//  Created by macbook on 01.04.2025.
//

import UIKit

class ViewController: UIViewController {

    private var circleView: UIView?
    private let circleDiameter: CGFloat = 80

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCircleView()
    }

    private func setupCircleView() {
        // Удаляем предыдущий кружок, если он существует
        circleView?.removeFromSuperview()

        // Создаем новый кружок
        let newCircleView = UIView()
        newCircleView.backgroundColor = generateRandomColor()
        newCircleView.layer.cornerRadius = circleDiameter / 2
        newCircleView.layer.masksToBounds = true
        newCircleView.isUserInteractionEnabled = true

        // Добавляем обработчик нажатия
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCircleTap))
        newCircleView.addGestureRecognizer(tapRecognizer)

        // Устанавливаем размер
        newCircleView.frame.size = CGSize(width: circleDiameter, height: circleDiameter)

        // Позиционируем
        positionCircleView(newCircleView)

        // Добавляем на экран
        view.addSubview(newCircleView)
        circleView = newCircleView
    }

    private func positionCircleView(_ circleView: UIView) {
        let safeArea = view.safeAreaLayoutGuide.layoutFrame
        let radius = circleDiameter / 2

        // Вычисляем допустимые границы
        let minX = safeArea.minX + radius
        let maxX = safeArea.maxX - radius
        let minY = safeArea.minY + radius
        let maxY = safeArea.maxY - radius

        // Устанавливаем случайную позицию
        circleView.center = CGPoint(
            x: CGFloat.random(in: minX...maxX),
            y: CGFloat.random(in: minY...maxY)
        )
    }

    private func generateRandomColor() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }

    @objc private func handleCircleTap() {
        guard let circleView = circleView else { return }

        circleView.backgroundColor = generateRandomColor()
        positionCircleView(circleView)
    }
}
