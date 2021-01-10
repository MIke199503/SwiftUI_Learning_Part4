//
//  SideBar.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/10.
//

import SwiftUI

struct SideBar: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(SidebarListStyle()) // 没法在定义的时候使用，在这里来使用就可以了
        #else
        content
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300) // 设置在macos下的时候，默认的最大最小宽度，以及理想宽度。
        #endif
        
    }
    
    var content : some View{
        NavigationView {
            List {
                NavigationLink(destination: CoursesView()){
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            }
//            .listStyle(SidebarListStyle()) //这个设置不能放在这里，因为属于ios和pados的modifier，mac没有。
            .navigationTitle("Learn")
//            .navigationBarTitleDisplayMode(.inline) /设置title的现实模式
            
            CoursesView()
        }
    }
    
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
