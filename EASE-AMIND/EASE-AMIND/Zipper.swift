//
//  Zipper.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/24/24.
//

import SwiftUI

class Zipper: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        
        let zipper = UISlider(frame:CGRect(x: 0, y: 0, width: 300, height: 20))
        zipper.center = self.view.center
 
        zipper.minimumValue = 0
        zipper.maximumValue = 100
        zipper.isContinuous = true
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
     
    }
}

#Preview {
    Zipper()
}
