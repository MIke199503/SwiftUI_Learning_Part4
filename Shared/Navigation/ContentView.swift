//
//  ContentView.swift
//  Shared
//
//  Created by 朱桃禾 on 2021/1/10.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass)  var horizontalSizeClass
    #endif
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact{
            TabBar()
        }else{
            SideBar()
        }
        #else
            SideBar()
                .frame(minWidth:1000,minHeight:600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
            //                .previewLayout(.fixed(width: 200, height: 200))
            //只显示指定大小的布局。
        }
        
    }
}
