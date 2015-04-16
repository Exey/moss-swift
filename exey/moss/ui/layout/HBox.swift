//
//  HBox.swift
//  Created by Exey Panteleev
//

import Foundation

class HBox: UIView {
    
    var elements:[UIView]?
    
    //private
    private var sizeX:CGFloat?
    private var cols:Int?
    private var gapX:CGFloat?
    private var startX:CGFloat?
    
    /**
     * Constructor
     */
    required init(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    /**
     * Constructor
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        elements = [UIView]()
    }
    
    func add(element:UIView){
        elements!.append(element)
        addSubview(element)
    }
    
    func arrange(sizeX:CGFloat, cols:Int, gapX:CGFloat = 0, startX:CGFloat = 0) {
        self.sizeX = sizeX
        self.cols = cols
        self.gapX = gapX
        self.startX = startX
        for var i:Int = 0; i < elements!.count; i++ {
            let v:UIView = elements![i]
            let gap = CGFloat(i % cols) * (sizeX + gapX)
            v.frame.origin.x = startX + gap
            frame.size.width = v.frame.origin.x + v.frame.width
        }
    }
    
    func clone()->LayoutRow {
        var row:LayoutRow = LayoutRow(frame: self.frame)
        for el in elements! {
            row.add((el as CategoryItem).clone())
        }
        row.arrange(self.sizeX!, cols: self.cols!, gapX: self.gapX!, startX: self.startX!)
        return row
    }
    
    
}