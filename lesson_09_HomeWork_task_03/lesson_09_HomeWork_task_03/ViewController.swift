//
//  ViewController.swift
//  lesson_09_HomeWork_task_03
//
//  Created by macbook on 04.04.2025.
//

import UIKit

class ViewController: UIViewController {


    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ща будут квадраты", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }

    private func setupUI() {
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupActions(){
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc
    private func buttonTapped(){

        button.isHidden = true

        let squaresCountWidth = 5 // Количество квадратов в ряду
        let screenWidth = view.bounds.width
        let squareSize = screenWidth / CGFloat(squaresCountWidth)

        // Вычисляем количество рядов
        let screenHeight = view.bounds.height
        let squaresCountHeight = Int(ceil(screenHeight / squareSize))


        for row in 0..<squaresCountHeight {
            for column in 0..<squaresCountWidth {
                let square = UIView()
                square.frame = CGRect(
                    x: CGFloat(column) * squareSize,
                    y: CGFloat(row) * squareSize,
                    width: squareSize,
                    height: squareSize
                )

                square.backgroundColor = UIColor(
                    red: CGFloat.random(in: 0...1),
                    green: CGFloat.random(in: 0...1),
                    blue: CGFloat.random(in: 0...1),
                    alpha: 1.0
                )

                view.addSubview(square)
                view.sendSubviewToBack(square)
            }
        }
    }
}


