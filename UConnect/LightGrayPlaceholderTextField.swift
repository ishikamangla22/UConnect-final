//
//  LightGrayPlaceholderTextField.swift
//  UConnect
//
//  Created by student on 17/04/24.
//

import UIKit

class LightGrayPlaceholderTextField: UITextField {
    override func drawPlaceholder(in rect: CGRect) {
        if let placeholder = self.placeholder {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray,
                .font: self.font ?? UIFont.systemFont(ofSize: 12) // Set the font size as per your requirement
            ]
            placeholder.draw(in: rect, withAttributes: attributes)
        } else {
            super.drawPlaceholder(in: rect)
        }
    }
}
