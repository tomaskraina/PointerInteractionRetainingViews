/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Primary view controller for the sample code project.
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
    }
    
    func setupButtons() {
        /** Turn on and provide pointer style providers for the four UIButtons in this view controller.
            For convenience reference the buttons by their view tag.
        */
        for tag in 1...5 {
            if let button = view.viewWithTag(tag) as? UIButton {
                /** Set the pointerStyleProvider on this button.
                    Note: When setting a provider, setting "isPointerInteractionEnabled" to true for this button is not necessary).
                */
                button.pointerStyleProvider = buttonProvider
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
        }
    }

    @objc
    func buttonTapped(_ sender: UIButton) {
        sender.removeFromSuperview()

        // Ensure clicked UIButton is released from memory
        weak var button = sender
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let button = button else { return }

            assertionFailure("Button was not released from memory: \(button)")
            // Open Debug Memory Graph to see what keeps a strong reference to this UIButton instance
        }
    }
}
