//
//  Helpers.swift
//  MOIE
//
//  Created by glnygl on 25.12.2020.
//

import UIKit

class Helpers {
    
    class func estimatedLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedString.Key.font: font]
        let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
        return rectangleHeight
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func getAge(date: String?) -> Int? {
        guard let date = date else { return nil }
        let formatter = DateFormatter()
        let calendar = Calendar.current
        formatter.dateFormat = "yyyy-MM-dd"
        guard let startDate = formatter.date(from: date) else { return nil }
        let now = Date()
        return calendar.dateComponents([.year], from: startDate, to: now).year
    }
    
    class func formatDate(date: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let formattedDate = formatter.date(from: date) else { return nil }
        formatter.dateFormat = "dd.MM.yy"
        return formatter.string(from: formattedDate)
    }
}
