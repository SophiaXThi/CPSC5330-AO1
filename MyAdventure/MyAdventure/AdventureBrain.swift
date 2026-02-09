//
//  AdventureBrain.swift
//  LlamaAdventure
//
//  Created by Sophia Thi on 2/8/26.
//
import Foundation

final class AdventureBrain {

    // Tracks current position in the story array
    private var index: Int = 0

    // Tracks how many steps the user has taken (optional UI)
    private(set) var step: Int = 1

    // ########## STORY DATA (3+ layers) ##########
    private let nodes: [AdventureNode] = [

        // 0 - START
        AdventureNode(
            text: "At the farmer’s market, a llama wearing sunglasses stares at you like it knows your secrets. What do you do?",
            choice1: "Offer a snack politely",
            choice1Destination: 1,
            choice2: "Offer a tiny hat dramatically",
            choice2Destination: 2,
            isEnding: false,
            imageName: "scene0"
        ),

        // 1 - SNACK PATH
        AdventureNode(
            text: "The llama accepts the snack and follows you like a tiny VIP. The vendor watches closely.",
            choice1: "Ask the vendor to adopt it",
            choice1Destination: 3,
            choice2: "Walk calmly toward your car",
            choice2Destination: 4,
            isEnding: false,
            imageName: "scene1"
        ),

        // 2 - HAT PATH
        AdventureNode(
            text: "The llama judges the hat… then nods once. A goose nearby looks impressed.",
            choice1: "Offer a second hat",
            choice1Destination: 5,
            choice2: "Invite it to come home",
            choice2Destination: 6,
            isEnding: false,
            imageName: "scene2"
        ),

        // 3 - VENDOR TEST
        AdventureNode(
            text: "Vendor: “You may adopt Sir Fluffington if you pass the Official Llama Compatibility Test.”",
            choice1: "Take the test",
            choice1Destination: 7,
            choice2: "Try charming persuasion",
            choice2Destination: 8,
            isEnding: false,
            imageName: "scene3"
        ),

        // 4 - SUCCESS
        AdventureNode(
            text: "✅ SUCCESS! The llama hops into your car with calm confidence. You drive home with a new fluffy roommate — you take the llama home. 🦙",
            choice1: "Play again",
            choice1Destination: 0,
            choice2: "Play again",
            choice2Destination: 0,
            isEnding: true,
            imageName: "scene4_success"
        ),

        // 5 - SUCCESS
        AdventureNode(
            text: "✅ SUCCESS! Two hats means maximum trust. The llama chooses you — you take the llama home. 🦙",
            choice1: "Play again",
            choice1Destination: 0,
            choice2: "Play again",
            choice2Destination: 0,
            isEnding: true,
            imageName: "scene5_success"
        ),

        // 6 - FAILURE
        AdventureNode(
            text: "❌ FAILURE! The llama spots cupcakes and chooses frosting, fame, and freedom.",
            choice1: "Try again",
            choice1Destination: 0,
            choice2: "Try again",
            choice2Destination: 0,
            isEnding: true,
            imageName: "scene6_fail"
        ),

        // 7 - SUCCESS
        AdventureNode(
            text: "✅ SUCCESS! You answer correctly: “Llamas prefer peaceful vibes and snack schedules.” Paperwork approved — you take the llama home. 🦙",
            choice1: "Play again",
            choice1Destination: 0,
            choice2: "Play again",
            choice2Destination: 0,
            isEnding: true,
            imageName: "scene7_success"
        ),

        // 8 - FAILURE
        AdventureNode(
            text: "❌ FAILURE! Your persuasion summons a committee of geese. They escort you away with intense politeness.",
            choice1: "Try again",
            choice1Destination: 0,
            choice2: "Try again",
            choice2Destination: 0,
            isEnding: true,
            imageName: "scene8_fail"
        )
    ]

    // Returns the current story node
    func currentNode() -> AdventureNode {
        nodes[index]
    }

    // Moves to the next scene based on which choice was selected
    func choose(_ number: Int) {
        let current = nodes[index]
        let nextIndex = (number == 1) ? current.choice1Destination : current.choice2Destination

        index = nextIndex

        // If we loop back to the start, reset the step counter.
        if index == 0 {
            step = 1
            return
        }

        // Only increment step if the new node is NOT an ending.
        if !nodes[index].isEnding {
            step += 1
        }
    }

    // Resets the story
    func reset() {
        index = 0
        step = 1
    }
}

