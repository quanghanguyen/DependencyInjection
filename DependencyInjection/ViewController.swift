//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Nguyen Quang Ha on 11/10/2022.
//

import UIKit
import MyAppUIKit
import APIKit

extension APICaller: DataFetchable {}

class ViewController: UIViewController {
    
    let button: UIButton = {
        let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        blueButton.backgroundColor = .systemBlue
        blueButton.setTitle("Tap me", for: .highlighted)
        blueButton.setTitleColor(.white, for: .normal)
        return blueButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let vc = CoursesViewController(dataFetchable: APICaller.shared)
        present(vc, animated: true)
    }
}

