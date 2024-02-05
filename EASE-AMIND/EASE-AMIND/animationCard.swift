//
//  AnimatedCardView.swift
//  GardenApp
//
//  Created by Michael Steudter on 14.07.21.
//
//

import UIKit
import SwiftUI


/// A view with an animated layer, that expands a colored layer with the view's bounds to a given `CGRect`.
class AnimatedCardView: UIView {

    /// The colored card shape.
    private let shapeLayer = CAShapeLayer()
    /// The alpha mask, needed so that the animation does not clip.
    private let maskLayer = CAShapeLayer()
    /// The initial path at the animation's beginning
    private var initialPath = UIBezierPath()
    /// The final path at the animation's end.
    private var finalPath = UIBezierPath()

    /// The initializer.
    /// - Parameters:
    ///   - frame: The view's frame.
    ///   - cornerRadius: The layer's corner radius.
    init(frame: CGRect, cornerRadius: CGFloat) {
        super.init(frame: frame)
        backgroundColor = .clear
        initialPath = UIBezierPath(roundedRect: frame, cornerRadius: cornerRadius)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.path = initialPath.cgPath
        layer.addSublayer(shapeLayer)
        maskLayer.path = shapeLayer.path
        maskLayer.position =  shapeLayer.position
        shapeLayer.fillColor = UIColor.red.cgColor
        layer.mask = maskLayer
    }

    /// Not implemented. Always `nil`.
    required init?(coder: NSCoder) { nil }

    /// Animates the view's layer to the size of a given frame.
    /// - Parameters:
    ///   - frame: The final frame of the layer.
    ///   - duration: The animation's duration.
    ///   - completed: The animation's completion handler.
    func animate(to frame: CGRect, duration: CFTimeInterval = 1, completed: (() -> Void)?) {
        if let superview = superview {
            let frame = superview.convert(frame, to: self)
//            finalPath = UIBezierPath(roundedRect: frame, cornerRadius: .leastNonzeroMagnitude)
            finalPath = UIBezierPath(rect: frame)
        }

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completed?()
        }

        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = duration
        animation.fromValue = initialPath.cgPath
        animation.toValue = finalPath.cgPath
        animation.timingFunction = CAMediaTimingFunction(name: .default)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "animateCard")
        maskLayer.add(animation, forKey: "animateCard")
        CATransaction.commit()
    }

    /// Animates the view's layer back to its initial bounds.
    /// - Parameters:
    ///   - duration: The animation's duration.
    ///   - completed: The animation's completion handler.
    func reverseAnimation(duration: CFTimeInterval = 1, completed: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completed?()
        }
        let reverseAnimation = CABasicAnimation(keyPath: "path")
        reverseAnimation.duration = duration
        reverseAnimation.fromValue = finalPath.cgPath
        reverseAnimation.toValue = initialPath.cgPath
        reverseAnimation.timingFunction = CAMediaTimingFunction(name: .default)
        reverseAnimation.isRemovedOnCompletion = false
        reverseAnimation.fillMode = .backwards
        shapeLayer.removeAnimation(forKey: "animateCard")
        maskLayer.removeAnimation(forKey: "animateCard")
        shapeLayer.add(reverseAnimation, forKey: "animateCard")
        maskLayer.add(reverseAnimation, forKey: "animateCard")
        CATransaction.commit()
    }
}


//let superview = UIView(frame: .init(x: 0, y: 0, width: 200, height: 300))
//superview.backgroundColor = .black
//let view = AnimatedCardView(frame: .init(x: 0, y: 50, width: 200, height: 80), cornerRadius: 100)
//view.backgroundColor = .red
//superview.addSubview(view)
//
//PlaygroundPage.current.liveView = superview
//
//
//// Test it a couple of times
//view.animate(to: superview.frame) {
//    view.reverseAnimation {
//        view.animate(to: superview.frame) {
//            view.reverseAnimation {
//                view.animate(to: superview.frame) {
//                    view.reverseAnimation(completed: nil)
//                }
//            }
//        }
//    }
//}

#Preview {

    AnimatedCardView(coder: <#NSCoder#>)
}
