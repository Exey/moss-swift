//
//  Array2D
//  Created by Exey Panteleev
//

import Foundation

class Array2D<T> {
    let columns: Int
    let rows: Int
    var array: Array<T?>  // private
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}