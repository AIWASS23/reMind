//
//  GradientGenerator.swift
//  reMind
//
//  Created by Marcelo De Araújo on 31/01/24.
//

import SwiftUI

enum GradientType: CaseIterable {
    case linear
    case radial
    case angular
    case elliptical
}

struct GradientGenerator {

    static func randomGradient(type: GradientType? = nil) -> AnyView {

        let startPoint = UnitPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
        let endPoint = UnitPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
        let centerPoint = UnitPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))

        var gradientType = type
        if gradientType == nil {
            let randomIndex = Int.random(in: 0..<4)
            gradientType = GradientType.allCases[randomIndex]
        }

        switch gradientType! {
        case .linear:

            let color1 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            let color2 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            return AnyView(
                LinearGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )

        case .radial:

            let color1 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            let color2 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            return AnyView(
                RadialGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    center: centerPoint,
                    startRadius: Double.random(in: 0...360),
                    endRadius: Double.random(in: 0...360)
                )
            )

        case .angular:

            let color1 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            let color2 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            return AnyView(
                AngularGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    center: centerPoint,
                    angle: Angle(degrees: Double.random(in: 0...360))
                )
            )

        case .elliptical:

            let color1 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            let color2 = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1),
                opacity: 1)

            return AnyView(
                EllipticalGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    center: centerPoint,
                    startRadiusFraction: Double.random(in: 0...1),
                    endRadiusFraction: Double.random(in: 0...1)
                )
            )
        }
    }
}

