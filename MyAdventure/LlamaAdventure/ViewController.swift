//
//  ViewController.swift
//  LlamaAdventure
//
//  Created by Sophia Thi on 2/8/26.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var storyLabel: UILabel!
    @IBOutlet private weak var choice1Button: UIButton!
    @IBOutlet private weak var choice2Button: UIButton!

    private let brain = AdventureBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateUI()
    }

    private func configureUI() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true

        storyLabel.numberOfLines = 0
        storyLabel.textAlignment = .center

        [choice1Button, choice2Button].forEach { button in
            button?.titleLabel?.numberOfLines = 0
            button?.titleLabel?.textAlignment = .center
        }
    }

    private func updateUI() {
        let node = brain.currentNode()

        storyLabel.text = node.text

        choice1Button.setTitle(node.choice1, for: .normal)
        choice2Button.setTitle(node.choice2, for: .normal)

        // NEW: swap background per scene because I didn't spend hours on pixbay looking for them for nothing
        backgroundImageView.image = UIImage(named: node.imageName)
        
        
    }

    @IBAction private func choicePressed(_ sender: UIButton) {
        if sender == choice1Button {
            brain.choose(1)
        } else {
            brain.choose(2)
        }
        updateUI()
    }
}





