//
//  ViewController.swift
//  lesson_09_HomeWork_task_02
//
//  Created by macbook on 04.04.2025.
//

import UIKit

class ViewController: UIViewController {

    private var circleView = UIView()
    private let circleSize: CGFloat = 60
    private let moveDistance: CGFloat = 30
    private let buttonSize: CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(circleView)

        circleView.backgroundColor = .systemBlue
        circleView.layer.cornerRadius = circleSize / 2


        circleView.frame = CGRect(
            x: view.bounds.midX - circleSize/2,
            y: view.bounds.midY - circleSize/2,
            width: circleSize,
            height: circleSize)


        //создаем кнопки
        let upButton = createButton(title: "↑", action: #selector(moveUp))
        let downButton = createButton(title: "↓", action: #selector(moveDown))
        let leftButton = createButton(title: "←", action: #selector(moveLeft))
        let rightButton = createButton(title: "→", action: #selector(moveRight))

        // Размещение кнопок внизу экрана
        let buttonY = view.bounds.height - buttonSize - 50
        let spacing = (view.bounds.width - 4 * buttonSize) / 5

        upButton.frame = CGRect(
            x: view.bounds.midX - buttonSize/2,
            y: buttonY - buttonSize - 20,
            width: buttonSize,
            height: buttonSize
        )

        downButton.frame = CGRect(
            x: view.bounds.midX - buttonSize/2,
            y: buttonY,
            width: buttonSize,
            height: buttonSize
        )

        leftButton.frame = CGRect(
            x: view.bounds.midX - buttonSize/2 - buttonSize - spacing,
            y: buttonY,
            width: buttonSize,
            height: buttonSize
        )

        rightButton.frame = CGRect(
            x: view.bounds.midX + buttonSize/2 + spacing,
            y: buttonY,
            width: buttonSize,
            height: buttonSize
        )

        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }

    private func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = buttonSize / 2
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    // MARK: - Movement Methods
    @objc private func moveUp() {
        var newFrame = circleView.frame
        newFrame.origin.y = max(0, newFrame.origin.y - moveDistance)
        circleView.frame = newFrame
    }

    @objc private func moveDown() {
        var newFrame = circleView.frame
        newFrame.origin.y = min(
            view.bounds.height - circleSize,
            newFrame.origin.y + moveDistance
        )
        circleView.frame = newFrame
    }

    @objc private func moveLeft() {
        var newFrame = circleView.frame
        newFrame.origin.x = max(0, newFrame.origin.x - moveDistance)
        circleView.frame = newFrame
    }

    @objc private func moveRight() {
        var newFrame = circleView.frame
        newFrame.origin.x = min(
            view.bounds.width - circleSize,
            newFrame.origin.x + moveDistance
        )
        circleView.frame = newFrame
    }

}

