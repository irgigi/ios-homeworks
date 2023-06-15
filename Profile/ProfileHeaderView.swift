//
//  ProfileHeaderView.swift
//  Navigation
//
//

import UIKit

class ProfileHeaderView: UIView {
    
   // override func awakeFromNib() {
   //     super.awakeFromNib()
    
    
    override func draw(_ rect: CGRect) {
        
        let height = rect.height
        let width = rect.width
        let color: UIColor = .systemYellow
        
        let photo = CGRect(
            x: 16.0,
            y: 16.0,
            width: 120.0,
            height: 120.0
            )
        
     //   let bpath: UIBezierPath = UIBezierPath(rect: photo)
        
        color.set()
      //  bpath.stroke()
    }
}



