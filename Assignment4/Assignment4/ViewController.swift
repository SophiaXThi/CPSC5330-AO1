//
//  ViewController.swift
//  Assignment4
//
//  Created by Sophia Thi on 2/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedEntryLabel: UILabel!

    private var currentMoodEmoji = "😐"
    private var currentMoodDescript = "Neutral"

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.isContinuous = true

        savedEntryLabel.text = ""
        savedEntryLabel.numberOfLines = 0
        savedEntryLabel.textAlignment = .center

        updateMoodLabel(for: slider.value)
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        updateMoodLabel(for: sender.value)
    }

    @IBAction func saveMoodButtonTapped(_ sender: UIButton) {
        let dateText = formattedDate(datePicker.date)
        savedEntryLabel.text = "On \(dateText), you felt \(currentMoodEmoji)"
    }

    private func updateMoodLabel(for rawValue: Float) {
        let value = Int(rawValue.rounded())

        switch value {
        case 0...20:
            currentMoodDescript = "Very Sad"
            currentMoodEmoji = "😢"
        case 21...40:
            currentMoodDescript = "Sad"
            currentMoodEmoji = "🙁"
        case 41...60:
            currentMoodDescript = "Neutral"
            currentMoodEmoji = "😐"
        case 61...80:
            currentMoodDescript = "Happy"
            currentMoodEmoji = "🙂"
        default:
            currentMoodDescript = "Very Happy"
            currentMoodEmoji = "😁"
        }

        moodLabel.text = "Feeling: \(currentMoodDescript) \(currentMoodEmoji)"
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

