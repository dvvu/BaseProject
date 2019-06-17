
//
//  ItemViewModel.swift
//  BaseProject
//
//  Created by Doan Van Vu on 6/13/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import UIKit

class ItemViewModel {
    
    private var item: Item
    var colorText: String = ""
    
    var keywordText: String {
        return item.keyword
    }
    
    var widthCell: CGFloat {
        let stringLengh = item.keyword.widthOfString(usingFont: APP_FONT.font())/2
        let components = item.keyword.components(separatedBy: .whitespacesAndNewlines)
        let words = components.count
        var frontStrings = ""
        var tailStrings = ""
        
        for i in 0..<words {
            frontStrings += components[i] + " "
            tailStrings += " " + components[words - 1 - i]
            
            let frontStringlengh = frontStrings.widthOfString(usingFont: APP_FONT.font())
            let tailStringlengh = tailStrings.widthOfString(usingFont: APP_FONT.font())
            // check tail lengh and front lengh
            // 16 is padding of label
            if frontStringlengh > tailStringlengh {
                if frontStringlengh >= stringLengh {
                    return frontStringlengh + 16
                }
            } else {
                if tailStringlengh >= stringLengh {
                    return tailStringlengh + 16
                }
            }
        }
        
        return stringLengh
    }
    
    var iconURL: URL {
        return URL(string: item.icon) ?? URL(string: "")!
    }
    
    var color: UIColor {
        return UIColor.init(hex: self.colorText)
    }
    
    init(item: Item) {
        self.item = item
    }
}

extension ItemViewModel {
    static var dataTest: [ItemViewModel] {
        return [
            ItemViewModel(item: Item(keyword: "Iphone Iphone1", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Ipad", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
            ItemViewModel(item: Item(keyword: "Sim 3G/ 4G Vinaphone Nghe Gọi Tặng 3GB", icon: "https://tee.tikicdn.com/cache/300x300/ts/product/bb/05/0d/34b3c97a3fc1dcca5bdc0668afdf8910.jpg")),
        ]
    }
}
