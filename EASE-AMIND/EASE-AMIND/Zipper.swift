//
//  Zipper.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/24/24.
//

import SwiftUI
import UIKit

class Zipper: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .clear
        
        let zipper = UISlider(frame:CGRect(x: 10, y: 10, width: 700, height: 10))
        zipper.center = self.view.center
        zipper.transform = CGAffineTransform(rotationAngle: -80.11)
        zipper.minimumValue = 0
        zipper.maximumValue = 100
        zipper.isContinuous = true
        zipper.tintColor = .clear
        
        zipper.setThumbImage(UIImage(named: "Zipper"), for: .normal)
        zipper.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        view.addSubview(zipper)
        
        
        UIView.animate(withDuration: 0.8) {
            zipper.setValue(80.0, animated: true)
        }
        self.view = view
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        let currentValue = Int(sender.value)
        if currentValue % 2 == 0 && currentValue != 0{
            let generator = UIImpactFeedbackGenerator(style: .rigid)
            generator.impactOccurred()
        }
    }
}

struct SliderView: UIViewControllerRepresentable {
    typealias UIViewControllerType = Zipper
    
    func makeUIViewController(context: Context) -> Zipper {
        let vc = Zipper()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: Zipper, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}


#Preview {
    Zipper()
}
