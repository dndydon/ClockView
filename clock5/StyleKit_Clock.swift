//
//  StyleKit_Clock.swift
//  Clock
//
//  Created by Don Sleeter on 1/22/18.
//  Copyright © 2018 Stone Canyon. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class StyleKit_Clock : NSObject {

    //// Cache

    private struct Cache {
        static let silverGradientColor: UIColor = UIColor(red: 0.928, green: 0.928, blue: 0.928, alpha: 1.000)
        static let tickColor: UIColor = UIColor(red: 0.638, green: 0.638, blue: 0.638, alpha: 1.000)
        static let lightHandColor: UIColor = UIColor(red: 0.941, green: 0.232, blue: 0.232, alpha: 0.827)
        static let faceColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        static let numbersColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let darkHandsColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let rimColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let shadowColor2: UIColor = UIColor(red: 0.283, green: 0.283, blue: 0.283, alpha: 1.000)
    }

    //// Colors

    @objc dynamic public class var silverGradientColor: UIColor { return Cache.silverGradientColor }
    @objc dynamic public class var tickColor: UIColor { return Cache.tickColor }
    @objc dynamic public class var lightHandColor: UIColor { return Cache.lightHandColor }
    @objc dynamic public class var faceColor: UIColor { return Cache.faceColor }
    @objc dynamic public class var numbersColor: UIColor { return Cache.numbersColor }
    @objc dynamic public class var darkHandsColor: UIColor { return Cache.darkHandsColor }
    @objc dynamic public class var rimColor: UIColor { return Cache.rimColor }
    @objc dynamic public class var shadowColor2: UIColor { return Cache.shadowColor2 }

    //// Drawing Methods

    @objc dynamic public class func drawClock(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 232, height: 232), resizing: ResizingBehavior = .aspectFit, hours: CGFloat = 3, minutes: CGFloat = 42, seconds: CGFloat = 24, scale: CGFloat = 0.92) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 232, height: 232), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 232, y: resizedFrame.height / 232)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 232, resizedFrame.height / 232)


        //// Color Declarations
        let silverGradientColor2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

        //// Gradient Declarations
        let silverGradient = CGGradient(colorsSpace: nil, colors: [StyleKit_Clock.faceColor.cgColor, StyleKit_Clock.faceColor.blended(withFraction: 0.5, of: silverGradientColor2).cgColor, silverGradientColor2.cgColor, silverGradientColor2.blended(withFraction: 0.5, of: StyleKit_Clock.silverGradientColor).cgColor, StyleKit_Clock.silverGradientColor.cgColor] as CFArray, locations: [0, 0.68, 0.74, 0.92, 0.99])!

        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = StyleKit_Clock.shadowColor2.withAlphaComponent(0.76 * StyleKit_Clock.shadowColor2.cgColor.alpha)
        shadow.shadowOffset = CGSize(width: 0, height: 3)
        shadow.shadowBlurRadius = 6

        //// Variable Declarations
        let expression = hours > 12 ? "PM" : "AM"
        let secondsAngle: CGFloat = -seconds / 60.0 * 360
        let minuteAngle: CGFloat = -(minutes / 60.0 * 360 - secondsAngle / 60.0)
        let hourAngle: CGFloat = -hours / 12.0 * 360 + minuteAngle / 12.0

        //// clockSymbol
        context.saveGState()
        context.translateBy(x: 116, y: 116)
        context.scaleBy(x: scale, y: scale)

        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        context.beginTransparencyLayer(auxiliaryInfo: nil)


        //// Oval 2 Drawing
        context.saveGState()

        let oval2Path = UIBezierPath(ovalIn: CGRect(x: -116, y: -116, width: 232, height: 232))
        StyleKit_Clock.rimColor.setFill()
        oval2Path.fill()

        context.restoreGState()


        //// Oval Drawing
        context.saveGState()

        let ovalPath = UIBezierPath(ovalIn: CGRect(x: -110, y: -110, width: 220, height: 220))
        context.saveGState()
        ovalPath.addClip()
        context.drawRadialGradient(silverGradient,
            startCenter: CGPoint(x: 0, y: 0), startRadius: 23.66,
            endCenter: CGPoint(x: 0, y: 0), endRadius: 109.8,
            options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        context.restoreGState()

        context.restoreGState()


        //// Bezier Drawing
        context.saveGState()
        context.rotate(by: -(minuteAngle + 90) * CGFloat.pi/180)

        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 7.07, y: -7.07))
        bezierPath.addCurve(to: CGPoint(x: 9.54, y: -3), controlPoint1: CGPoint(x: 8.25, y: -5.89), controlPoint2: CGPoint(x: 9.07, y: -4.49))
        bezierPath.addLine(to: CGPoint(x: 95, y: -3))
        bezierPath.addLine(to: CGPoint(x: 95, y: 3))
        bezierPath.addLine(to: CGPoint(x: 9.54, y: 3))
        bezierPath.addCurve(to: CGPoint(x: 7.07, y: 7.07), controlPoint1: CGPoint(x: 9.07, y: 4.49), controlPoint2: CGPoint(x: 8.25, y: 5.89))
        bezierPath.addCurve(to: CGPoint(x: -7.07, y: 7.07), controlPoint1: CGPoint(x: 3.17, y: 10.98), controlPoint2: CGPoint(x: -3.17, y: 10.98))
        bezierPath.addCurve(to: CGPoint(x: -7.07, y: -7.07), controlPoint1: CGPoint(x: -10.98, y: 3.17), controlPoint2: CGPoint(x: -10.98, y: -3.17))
        bezierPath.addCurve(to: CGPoint(x: 7.07, y: -7.07), controlPoint1: CGPoint(x: -3.17, y: -10.98), controlPoint2: CGPoint(x: 3.17, y: -10.98))
        bezierPath.close()
        StyleKit_Clock.darkHandsColor.setFill()
        bezierPath.fill()

        context.restoreGState()


        //// Bezier 2 Drawing
        context.saveGState()
        context.rotate(by: -(hourAngle + 90) * CGFloat.pi/180)

        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 7.07, y: -7.07))
        bezier2Path.addCurve(to: CGPoint(x: 8.66, y: -5), controlPoint1: CGPoint(x: 7.7, y: -6.44), controlPoint2: CGPoint(x: 8.24, y: -5.74))
        bezier2Path.addLine(to: CGPoint(x: 56, y: -5))
        bezier2Path.addLine(to: CGPoint(x: 56, y: 5))
        bezier2Path.addLine(to: CGPoint(x: 8.66, y: 5))
        bezier2Path.addCurve(to: CGPoint(x: 7.07, y: 7.07), controlPoint1: CGPoint(x: 8.24, y: 5.74), controlPoint2: CGPoint(x: 7.7, y: 6.44))
        bezier2Path.addCurve(to: CGPoint(x: -7.07, y: 7.07), controlPoint1: CGPoint(x: 3.17, y: 10.98), controlPoint2: CGPoint(x: -3.17, y: 10.98))
        bezier2Path.addCurve(to: CGPoint(x: -7.07, y: -7.07), controlPoint1: CGPoint(x: -10.98, y: 3.17), controlPoint2: CGPoint(x: -10.98, y: -3.17))
        bezier2Path.addCurve(to: CGPoint(x: 7.07, y: -7.07), controlPoint1: CGPoint(x: -3.17, y: -10.98), controlPoint2: CGPoint(x: 3.17, y: -10.98))
        bezier2Path.close()
        StyleKit_Clock.darkHandsColor.setFill()
        bezier2Path.fill()

        context.restoreGState()


        //// Bezier 3 Drawing
        context.saveGState()
        context.rotate(by: -(secondsAngle + 90) * CGFloat.pi/180)

        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 4.24, y: -4.24))
        bezier3Path.addCurve(to: CGPoint(x: 5.92, y: -1), controlPoint1: CGPoint(x: 5.16, y: -3.33), controlPoint2: CGPoint(x: 5.72, y: -2.19))
        bezier3Path.addLine(to: CGPoint(x: 99, y: -1))
        bezier3Path.addLine(to: CGPoint(x: 99, y: 1))
        bezier3Path.addLine(to: CGPoint(x: 5.92, y: 1))
        bezier3Path.addCurve(to: CGPoint(x: 4.24, y: 4.24), controlPoint1: CGPoint(x: 5.72, y: 2.19), controlPoint2: CGPoint(x: 5.16, y: 3.33))
        bezier3Path.addCurve(to: CGPoint(x: -4.24, y: 4.24), controlPoint1: CGPoint(x: 1.9, y: 6.59), controlPoint2: CGPoint(x: -1.9, y: 6.59))
        bezier3Path.addCurve(to: CGPoint(x: -4.24, y: -4.24), controlPoint1: CGPoint(x: -6.59, y: 1.9), controlPoint2: CGPoint(x: -6.59, y: -1.9))
        bezier3Path.addCurve(to: CGPoint(x: 4.24, y: -4.24), controlPoint1: CGPoint(x: -1.9, y: -6.59), controlPoint2: CGPoint(x: 1.9, y: -6.59))
        bezier3Path.close()
        StyleKit_Clock.lightHandColor.setFill()
        bezier3Path.fill()

        context.restoreGState()


        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle2Path.fill()




        //// Group 2
        context.saveGState()
        context.rotate(by: 90 * CGFloat.pi/180)



        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle4Path.fill()



        context.restoreGState()


        //// Group 3
        context.saveGState()
        context.rotate(by: -30 * CGFloat.pi/180)



        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle5Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle6Path.fill()



        context.restoreGState()


        //// Group 4
        context.saveGState()
        context.rotate(by: -60 * CGFloat.pi/180)



        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle7Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle8Path.fill()



        context.restoreGState()


        //// Group 5
        context.saveGState()
        context.rotate(by: -120 * CGFloat.pi/180)



        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle9Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle10Path.fill()



        context.restoreGState()


        //// Group 6
        context.saveGState()
        context.rotate(by: -150 * CGFloat.pi/180)



        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(rect: CGRect(x: -3, y: -110, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle11Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(rect: CGRect(x: -3, y: 102, width: 6, height: 8))
        StyleKit_Clock.tickColor.setFill()
        rectangle12Path.fill()



        context.restoreGState()


        //// Text 13 Drawing
        let text13Rect = CGRect(x: -31, y: 14, width: 62, height: 34)
        let text13Style = NSMutableParagraphStyle()
        text13Style.alignment = .center
        let text13FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 20)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text13Style,
        ] as [NSAttributedStringKey: Any]

        let text13TextHeight: CGFloat = expression.boundingRect(with: CGSize(width: text13Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text13FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text13Rect)
        expression.draw(in: CGRect(x: text13Rect.minX, y: text13Rect.minY + (text13Rect.height - text13TextHeight) / 2, width: text13Rect.width, height: text13TextHeight), withAttributes: text13FontAttributes)
        context.restoreGState()


        //// Text 11 Drawing
        let text11Path = UIBezierPath()
        text11Path.move(to: CGPoint(x: -49.77, y: -80.55))
        text11Path.addLine(to: CGPoint(x: -53.27, y: -77.68))
        text11Path.addLine(to: CGPoint(x: -55.02, y: -79.75))
        text11Path.addLine(to: CGPoint(x: -49.5, y: -84.2))
        text11Path.addLine(to: CGPoint(x: -46.77, y: -84.2))
        text11Path.addLine(to: CGPoint(x: -46.77, y: -66.5))
        text11Path.addLine(to: CGPoint(x: -49.77, y: -66.5))
        text11Path.addLine(to: CGPoint(x: -49.77, y: -80.55))
        text11Path.close()
        text11Path.move(to: CGPoint(x: -37.52, y: -80.55))
        text11Path.addLine(to: CGPoint(x: -41.02, y: -77.68))
        text11Path.addLine(to: CGPoint(x: -42.77, y: -79.75))
        text11Path.addLine(to: CGPoint(x: -37.25, y: -84.2))
        text11Path.addLine(to: CGPoint(x: -34.52, y: -84.2))
        text11Path.addLine(to: CGPoint(x: -34.52, y: -66.5))
        text11Path.addLine(to: CGPoint(x: -37.52, y: -66.5))
        text11Path.addLine(to: CGPoint(x: -37.52, y: -80.55))
        text11Path.close()
        StyleKit_Clock.numbersColor.setFill()
        text11Path.fill()


        //// Text 10 Drawing
        let text10Path = UIBezierPath()
        text10Path.move(to: CGPoint(x: -78.28, y: -49.05))
        text10Path.addLine(to: CGPoint(x: -81.78, y: -46.18))
        text10Path.addLine(to: CGPoint(x: -83.53, y: -48.25))
        text10Path.addLine(to: CGPoint(x: -78, y: -52.7))
        text10Path.addLine(to: CGPoint(x: -75.28, y: -52.7))
        text10Path.addLine(to: CGPoint(x: -75.28, y: -35))
        text10Path.addLine(to: CGPoint(x: -78.28, y: -35))
        text10Path.addLine(to: CGPoint(x: -78.28, y: -49.05))
        text10Path.close()
        text10Path.move(to: CGPoint(x: -59.13, y: -43.85))
        text10Path.addCurve(to: CGPoint(x: -59.54, y: -39.97), controlPoint1: CGPoint(x: -59.13, y: -42.42), controlPoint2: CGPoint(x: -59.26, y: -41.13))
        text10Path.addCurve(to: CGPoint(x: -60.74, y: -37.05), controlPoint1: CGPoint(x: -59.81, y: -38.82), controlPoint2: CGPoint(x: -60.21, y: -37.85))
        text10Path.addCurve(to: CGPoint(x: -62.69, y: -35.2), controlPoint1: CGPoint(x: -61.26, y: -36.25), controlPoint2: CGPoint(x: -61.91, y: -35.63))
        text10Path.addCurve(to: CGPoint(x: -65.35, y: -34.55), controlPoint1: CGPoint(x: -63.46, y: -34.77), controlPoint2: CGPoint(x: -64.35, y: -34.55))
        text10Path.addCurve(to: CGPoint(x: -68.03, y: -35.2), controlPoint1: CGPoint(x: -66.35, y: -34.55), controlPoint2: CGPoint(x: -67.24, y: -34.77))
        text10Path.addCurve(to: CGPoint(x: -70, y: -37.05), controlPoint1: CGPoint(x: -68.81, y: -35.63), controlPoint2: CGPoint(x: -69.47, y: -36.25))
        text10Path.addCurve(to: CGPoint(x: -71.21, y: -39.97), controlPoint1: CGPoint(x: -70.53, y: -37.85), controlPoint2: CGPoint(x: -70.94, y: -38.82))
        text10Path.addCurve(to: CGPoint(x: -71.62, y: -43.85), controlPoint1: CGPoint(x: -71.49, y: -41.13), controlPoint2: CGPoint(x: -71.62, y: -42.42))
        text10Path.addCurve(to: CGPoint(x: -71.21, y: -47.72), controlPoint1: CGPoint(x: -71.62, y: -45.28), controlPoint2: CGPoint(x: -71.49, y: -46.57))
        text10Path.addCurve(to: CGPoint(x: -70, y: -50.65), controlPoint1: CGPoint(x: -70.94, y: -48.88), controlPoint2: CGPoint(x: -70.53, y: -49.85))
        text10Path.addCurve(to: CGPoint(x: -68.03, y: -52.5), controlPoint1: CGPoint(x: -69.47, y: -51.45), controlPoint2: CGPoint(x: -68.81, y: -52.07))
        text10Path.addCurve(to: CGPoint(x: -65.35, y: -53.15), controlPoint1: CGPoint(x: -67.24, y: -52.93), controlPoint2: CGPoint(x: -66.35, y: -53.15))
        text10Path.addCurve(to: CGPoint(x: -62.69, y: -52.5), controlPoint1: CGPoint(x: -64.35, y: -53.15), controlPoint2: CGPoint(x: -63.46, y: -52.93))
        text10Path.addCurve(to: CGPoint(x: -60.74, y: -50.65), controlPoint1: CGPoint(x: -61.91, y: -52.07), controlPoint2: CGPoint(x: -61.26, y: -51.45))
        text10Path.addCurve(to: CGPoint(x: -59.54, y: -47.72), controlPoint1: CGPoint(x: -60.21, y: -49.85), controlPoint2: CGPoint(x: -59.81, y: -48.88))
        text10Path.addCurve(to: CGPoint(x: -59.13, y: -43.85), controlPoint1: CGPoint(x: -59.26, y: -46.57), controlPoint2: CGPoint(x: -59.13, y: -45.28))
        text10Path.close()
        text10Path.move(to: CGPoint(x: -62.2, y: -43.85))
        text10Path.addCurve(to: CGPoint(x: -62.31, y: -45.95), controlPoint1: CGPoint(x: -62.2, y: -44.47), controlPoint2: CGPoint(x: -62.24, y: -45.17))
        text10Path.addCurve(to: CGPoint(x: -62.76, y: -48.18), controlPoint1: CGPoint(x: -62.39, y: -46.73), controlPoint2: CGPoint(x: -62.54, y: -47.47))
        text10Path.addCurve(to: CGPoint(x: -63.73, y: -49.94), controlPoint1: CGPoint(x: -62.99, y: -48.88), controlPoint2: CGPoint(x: -63.31, y: -49.46))
        text10Path.addCurve(to: CGPoint(x: -65.35, y: -50.65), controlPoint1: CGPoint(x: -64.14, y: -50.41), controlPoint2: CGPoint(x: -64.68, y: -50.65))
        text10Path.addCurve(to: CGPoint(x: -67, y: -49.94), controlPoint1: CGPoint(x: -66.03, y: -50.65), controlPoint2: CGPoint(x: -66.58, y: -50.41))
        text10Path.addCurve(to: CGPoint(x: -67.96, y: -48.18), controlPoint1: CGPoint(x: -67.42, y: -49.46), controlPoint2: CGPoint(x: -67.74, y: -48.88))
        text10Path.addCurve(to: CGPoint(x: -68.43, y: -45.95), controlPoint1: CGPoint(x: -68.19, y: -47.47), controlPoint2: CGPoint(x: -68.34, y: -46.73))
        text10Path.addCurve(to: CGPoint(x: -68.55, y: -43.85), controlPoint1: CGPoint(x: -68.51, y: -45.17), controlPoint2: CGPoint(x: -68.55, y: -44.47))
        text10Path.addCurve(to: CGPoint(x: -68.43, y: -41.75), controlPoint1: CGPoint(x: -68.55, y: -43.23), controlPoint2: CGPoint(x: -68.51, y: -42.53))
        text10Path.addCurve(to: CGPoint(x: -67.96, y: -39.55), controlPoint1: CGPoint(x: -68.34, y: -40.97), controlPoint2: CGPoint(x: -68.19, y: -40.23))
        text10Path.addCurve(to: CGPoint(x: -67, y: -37.81), controlPoint1: CGPoint(x: -67.74, y: -38.87), controlPoint2: CGPoint(x: -67.42, y: -38.29))
        text10Path.addCurve(to: CGPoint(x: -65.35, y: -37.1), controlPoint1: CGPoint(x: -66.58, y: -37.34), controlPoint2: CGPoint(x: -66.03, y: -37.1))
        text10Path.addCurve(to: CGPoint(x: -63.73, y: -37.81), controlPoint1: CGPoint(x: -64.68, y: -37.1), controlPoint2: CGPoint(x: -64.14, y: -37.34))
        text10Path.addCurve(to: CGPoint(x: -62.76, y: -39.55), controlPoint1: CGPoint(x: -63.31, y: -38.29), controlPoint2: CGPoint(x: -62.99, y: -38.87))
        text10Path.addCurve(to: CGPoint(x: -62.31, y: -41.75), controlPoint1: CGPoint(x: -62.54, y: -40.23), controlPoint2: CGPoint(x: -62.39, y: -40.97))
        text10Path.addCurve(to: CGPoint(x: -62.2, y: -43.85), controlPoint1: CGPoint(x: -62.24, y: -42.53), controlPoint2: CGPoint(x: -62.2, y: -43.23))
        text10Path.close()
        StyleKit_Clock.numbersColor.setFill()
        text10Path.fill()


        //// Text 9 Drawing
        let text9Rect = CGRect(x: -108, y: -20, width: 38, height: 40)
        let text9TextContent = "9"
        let text9Style = NSMutableParagraphStyle()
        text9Style.alignment = .center
        let text9FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text9Style,
        ] as [NSAttributedStringKey: Any]

        let text9TextHeight: CGFloat = text9TextContent.boundingRect(with: CGSize(width: text9Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text9FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text9Rect)
        text9TextContent.draw(in: CGRect(x: text9Rect.minX, y: text9Rect.minY + (text9Rect.height - text9TextHeight) / 2, width: text9Rect.width, height: text9TextHeight), withAttributes: text9FontAttributes)
        context.restoreGState()


        //// Text 8 Drawing
        let text8Rect = CGRect(x: -95, y: 24, width: 38, height: 40)
        let text8TextContent = "8"
        let text8Style = NSMutableParagraphStyle()
        text8Style.alignment = .center
        let text8FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text8Style,
        ] as [NSAttributedStringKey: Any]

        let text8TextHeight: CGFloat = text8TextContent.boundingRect(with: CGSize(width: text8Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text8FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text8Rect)
        text8TextContent.draw(in: CGRect(x: text8Rect.minX, y: text8Rect.minY + (text8Rect.height - text8TextHeight) / 2, width: text8Rect.width, height: text8TextHeight), withAttributes: text8FontAttributes)
        context.restoreGState()


        //// Text 7 Drawing
        let text7Rect = CGRect(x: -60.5, y: 57, width: 38, height: 40)
        let text7TextContent = "7"
        let text7Style = NSMutableParagraphStyle()
        text7Style.alignment = .center
        let text7FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text7Style,
        ] as [NSAttributedStringKey: Any]

        let text7TextHeight: CGFloat = text7TextContent.boundingRect(with: CGSize(width: text7Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text7FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text7Rect)
        text7TextContent.draw(in: CGRect(x: text7Rect.minX, y: text7Rect.minY + (text7Rect.height - text7TextHeight) / 2, width: text7Rect.width, height: text7TextHeight), withAttributes: text7FontAttributes)
        context.restoreGState()


        //// Text 6 Drawing
        let text6Rect = CGRect(x: -19, y: 68, width: 38, height: 40)
        let text6TextContent = "6"
        let text6Style = NSMutableParagraphStyle()
        text6Style.alignment = .center
        let text6FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text6Style,
        ] as [NSAttributedStringKey: Any]

        let text6TextHeight: CGFloat = text6TextContent.boundingRect(with: CGSize(width: text6Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text6FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text6Rect)
        text6TextContent.draw(in: CGRect(x: text6Rect.minX, y: text6Rect.minY + (text6Rect.height - text6TextHeight) / 2, width: text6Rect.width, height: text6TextHeight), withAttributes: text6FontAttributes)
        context.restoreGState()


        //// Text 5 Drawing
        let text5Rect = CGRect(x: 24, y: 57, width: 38, height: 40)
        let text5TextContent = "5"
        let text5Style = NSMutableParagraphStyle()
        text5Style.alignment = .center
        let text5FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text5Style,
        ] as [NSAttributedStringKey: Any]

        let text5TextHeight: CGFloat = text5TextContent.boundingRect(with: CGSize(width: text5Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text5FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text5Rect)
        text5TextContent.draw(in: CGRect(x: text5Rect.minX, y: text5Rect.minY + (text5Rect.height - text5TextHeight) / 2, width: text5Rect.width, height: text5TextHeight), withAttributes: text5FontAttributes)
        context.restoreGState()


        //// Text 12 Drawing
        let text12Rect = CGRect(x: 57.5, y: 24, width: 38, height: 40)
        let text12TextContent = "4"
        let text12Style = NSMutableParagraphStyle()
        text12Style.alignment = .center
        let text12FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text12Style,
        ] as [NSAttributedStringKey: Any]

        let text12TextHeight: CGFloat = text12TextContent.boundingRect(with: CGSize(width: text12Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text12FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text12Rect)
        text12TextContent.draw(in: CGRect(x: text12Rect.minX, y: text12Rect.minY + (text12Rect.height - text12TextHeight) / 2, width: text12Rect.width, height: text12TextHeight), withAttributes: text12FontAttributes)
        context.restoreGState()


        //// Text 14 Drawing
        let text14Rect = CGRect(x: 71, y: -20, width: 38, height: 40)
        let text14TextContent = "3"
        let text14Style = NSMutableParagraphStyle()
        text14Style.alignment = .center
        let text14FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text14Style,
        ] as [NSAttributedStringKey: Any]

        let text14TextHeight: CGFloat = text14TextContent.boundingRect(with: CGSize(width: text14Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text14FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text14Rect)
        text14TextContent.draw(in: CGRect(x: text14Rect.minX, y: text14Rect.minY + (text14Rect.height - text14TextHeight) / 2, width: text14Rect.width, height: text14TextHeight), withAttributes: text14FontAttributes)
        context.restoreGState()


        //// Text 15 Drawing
        let text15Rect = CGRect(x: 57, y: -64, width: 38, height: 40)
        let text15TextContent = "2"
        let text15Style = NSMutableParagraphStyle()
        text15Style.alignment = .center
        let text15FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text15Style,
        ] as [NSAttributedStringKey: Any]

        let text15TextHeight: CGFloat = text15TextContent.boundingRect(with: CGSize(width: text15Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text15FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text15Rect)
        text15TextContent.draw(in: CGRect(x: text15Rect.minX, y: text15Rect.minY + (text15Rect.height - text15TextHeight) / 2, width: text15Rect.width, height: text15TextHeight), withAttributes: text15FontAttributes)
        context.restoreGState()


        //// Text 1 Drawing
        let text1Rect = CGRect(x: 24, y: -94.5, width: 38, height: 40)
        let text1TextContent = "1"
        let text1Style = NSMutableParagraphStyle()
        text1Style.alignment = .center
        let text1FontAttributes = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 25)!,
            .foregroundColor: StyleKit_Clock.numbersColor,
            .paragraphStyle: text1Style,
        ] as [NSAttributedStringKey: Any]

        let text1TextHeight: CGFloat = text1TextContent.boundingRect(with: CGSize(width: text1Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text1FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text1Rect)
        text1TextContent.draw(in: CGRect(x: text1Rect.minX, y: text1Rect.minY + (text1Rect.height - text1TextHeight) / 2, width: text1Rect.width, height: text1TextHeight), withAttributes: text1FontAttributes)
        context.restoreGState()


        //// Text 16 Drawing
        let text16Path = UIBezierPath()
        text16Path.move(to: CGPoint(x: -6.27, y: -91.05))
        text16Path.addLine(to: CGPoint(x: -9.77, y: -88.18))
        text16Path.addLine(to: CGPoint(x: -11.52, y: -90.25))
        text16Path.addLine(to: CGPoint(x: -6, y: -94.7))
        text16Path.addLine(to: CGPoint(x: -3.27, y: -94.7))
        text16Path.addLine(to: CGPoint(x: -3.27, y: -77))
        text16Path.addLine(to: CGPoint(x: -6.27, y: -77))
        text16Path.addLine(to: CGPoint(x: -6.27, y: -91.05))
        text16Path.close()
        text16Path.move(to: CGPoint(x: 0.73, y: -79.75))
        text16Path.addLine(to: CGPoint(x: 7.55, y: -86.45))
        text16Path.addCurve(to: CGPoint(x: 8.86, y: -88.06), controlPoint1: CGPoint(x: 8.1, y: -86.98), controlPoint2: CGPoint(x: 8.54, y: -87.52))
        text16Path.addCurve(to: CGPoint(x: 9.35, y: -89.93), controlPoint1: CGPoint(x: 9.19, y: -88.6), controlPoint2: CGPoint(x: 9.35, y: -89.22))
        text16Path.addCurve(to: CGPoint(x: 8.54, y: -91.91), controlPoint1: CGPoint(x: 9.35, y: -90.76), controlPoint2: CGPoint(x: 9.08, y: -91.42))
        text16Path.addCurve(to: CGPoint(x: 6.53, y: -92.65), controlPoint1: CGPoint(x: 8, y: -92.4), controlPoint2: CGPoint(x: 7.33, y: -92.65))
        text16Path.addCurve(to: CGPoint(x: 4.48, y: -91.79), controlPoint1: CGPoint(x: 5.67, y: -92.65), controlPoint2: CGPoint(x: 4.99, y: -92.36))
        text16Path.addCurve(to: CGPoint(x: 3.53, y: -89.62), controlPoint1: CGPoint(x: 3.96, y: -91.21), controlPoint2: CGPoint(x: 3.64, y: -90.49))
        text16Path.addLine(to: CGPoint(x: 0.6, y: -90.07))
        text16Path.addCurve(to: CGPoint(x: 1.23, y: -92.1), controlPoint1: CGPoint(x: 0.68, y: -90.81), controlPoint2: CGPoint(x: 0.89, y: -91.48))
        text16Path.addCurve(to: CGPoint(x: 2.5, y: -93.7), controlPoint1: CGPoint(x: 1.56, y: -92.72), controlPoint2: CGPoint(x: 1.98, y: -93.25))
        text16Path.addCurve(to: CGPoint(x: 4.31, y: -94.76), controlPoint1: CGPoint(x: 3.02, y: -94.15), controlPoint2: CGPoint(x: 3.62, y: -94.5))
        text16Path.addCurve(to: CGPoint(x: 6.58, y: -95.15), controlPoint1: CGPoint(x: 5, y: -95.02), controlPoint2: CGPoint(x: 5.76, y: -95.15))
        text16Path.addCurve(to: CGPoint(x: 8.79, y: -94.82), controlPoint1: CGPoint(x: 7.34, y: -95.15), controlPoint2: CGPoint(x: 8.08, y: -95.04))
        text16Path.addCurve(to: CGPoint(x: 10.68, y: -93.84), controlPoint1: CGPoint(x: 9.5, y: -94.61), controlPoint2: CGPoint(x: 10.12, y: -94.28))
        text16Path.addCurve(to: CGPoint(x: 11.99, y: -92.21), controlPoint1: CGPoint(x: 11.23, y: -93.4), controlPoint2: CGPoint(x: 11.66, y: -92.85))
        text16Path.addCurve(to: CGPoint(x: 12.48, y: -89.97), controlPoint1: CGPoint(x: 12.31, y: -91.57), controlPoint2: CGPoint(x: 12.48, y: -90.83))
        text16Path.addCurve(to: CGPoint(x: 12.25, y: -88.39), controlPoint1: CGPoint(x: 12.48, y: -89.41), controlPoint2: CGPoint(x: 12.4, y: -88.88))
        text16Path.addCurve(to: CGPoint(x: 11.64, y: -87), controlPoint1: CGPoint(x: 12.1, y: -87.9), controlPoint2: CGPoint(x: 11.9, y: -87.43))
        text16Path.addCurve(to: CGPoint(x: 10.74, y: -85.76), controlPoint1: CGPoint(x: 11.38, y: -86.57), controlPoint2: CGPoint(x: 11.08, y: -86.15))
        text16Path.addCurve(to: CGPoint(x: 9.63, y: -84.62), controlPoint1: CGPoint(x: 10.4, y: -85.37), controlPoint2: CGPoint(x: 10.03, y: -84.99))
        text16Path.addLine(to: CGPoint(x: 4.53, y: -79.75))
        text16Path.addLine(to: CGPoint(x: 12.5, y: -79.75))
        text16Path.addLine(to: CGPoint(x: 12.5, y: -77))
        text16Path.addLine(to: CGPoint(x: 0.73, y: -77))
        text16Path.addLine(to: CGPoint(x: 0.73, y: -79.75))
        text16Path.close()
        StyleKit_Clock.numbersColor.setFill()
        text16Path.fill()


        context.endTransparencyLayer()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(StyleKit_ClockResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}



private extension UIColor {
    func blended(withFraction fraction: CGFloat, of color: UIColor) -> UIColor {
        var r1: CGFloat = 1, g1: CGFloat = 1, b1: CGFloat = 1, a1: CGFloat = 1
        var r2: CGFloat = 1, g2: CGFloat = 1, b2: CGFloat = 1, a2: CGFloat = 1

        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return UIColor(red: r1 * (1 - fraction) + r2 * fraction,
            green: g1 * (1 - fraction) + g2 * fraction,
            blue: b1 * (1 - fraction) + b2 * fraction,
            alpha: a1 * (1 - fraction) + a2 * fraction);
    }
}