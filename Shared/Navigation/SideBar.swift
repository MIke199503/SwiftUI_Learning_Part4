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
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading ){
                    Image(systemName: "person.crop.circle")
                }
                //placement就是将工具栏放到那个位置，可以有很多选择，toolbar简单来说，就类似于微信的发朋友圈那个相机图标。
                //.bottomBar放在下方
            }
                
            
        #else
        content
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300) // 设置在macos下的时候，默认的最大最小宽度，以及理想宽度。
            .toolbar{
                ToolbarItem(placement: .automatic ){
                    Button(action: {} )
                        {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        //在macos上，视同toolbar，有点像电脑版微信的右上角那三个小点，点击就会出现群信息的那个。
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
