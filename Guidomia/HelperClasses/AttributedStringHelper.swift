//
//  AttributedStringHelper.swift
//  Guidomia
//
//  Created by Vish on 2022-12-04.
//
import UIKit

extension NSAttributedString {
    private func addLineSpace(spacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
    
    func showBulletText(array prosConsArray:[String]) -> NSAttributedString {
        
        var attributes = [NSAttributedString.Key: AnyObject]()
        attributes[.font] = UIFont.systemFont(ofSize: 20, weight: .heavy)
        attributes[.foregroundColor] = UIColor(named: "Orange")
        let attributedString = NSAttributedString(string:  Constants.bulletPoint, attributes: attributes)
        let bullet = attributedString
        let finalString = NSMutableAttributedString()
        prosConsArray.forEach {
            finalString.append(bullet)
            finalString.append(NSAttributedString(string: $0))
            finalString.append(NSAttributedString(string: Constants.newLine))
        }
        let combination = NSMutableAttributedString()
        combination.append(finalString)
        return combination.addLineSpace(spacing: Constants.spaceBetweenBullets)
    }
}
