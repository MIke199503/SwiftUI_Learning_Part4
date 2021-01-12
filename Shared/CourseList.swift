//
//  CourseList.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/11.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder // 想要预览macos版本下的内容，就必须使用bigsur系统，和最新的xcode12
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth:800,minHeight:600)
        #endif
    }
    
    var content:some View{
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
