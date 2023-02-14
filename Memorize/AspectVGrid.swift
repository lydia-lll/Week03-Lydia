//
//  AspectVGrid.swift
//  Memorize
//
//  Created by ldy on 2/7/23.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRacio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRacio: CGFloat, @ViewBuilder content: @escaping (Item)->ItemView){
        self.items = items
        self.aspectRacio = aspectRacio
        self.content = content
    }
    
    var body: some View {
        let width: CGFloat = 100
        LazyVGrid(columns: [adaptiveGridItem(width:width)], spacing: 0){
            ForEach(items) { item in
                content(item).aspectRatio(aspectRacio, contentMode: .fit)
            }
            
        }
    }
    private func adaptiveGridItem(width: CGFloat) -> GridItem{
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
