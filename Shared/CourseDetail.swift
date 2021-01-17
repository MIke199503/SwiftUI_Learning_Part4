//
//  CourseDetail.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/17.
//

import SwiftUI

struct CourseDetail: View {
    var course:Course = courses[0]
    var namespace:Namespace.ID
    //namespace 在我看来，是不是就是开辟一个空间来存放view，
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height:300)
                VStack{
                    ForEach( courseSections ){ item in
                        CourseRow(item: item)
                        Divider()
                    }
                }
                .padding()
                
            }
        }
        //                        .zIndex(1)//防止遮挡
        //这里的transition，我的理解是当你的view和animation链接，然后按照特定的方式出现。
        //使用透明度来过渡，并且在过渡的时候，添加一个Spring效果。并且有延迟。
        //.asymmetric 就是分开来处理。因为如果同时处理的话，推出的时候，延迟效果没必要，大可不必，兄弟。

        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22,style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail( namespace: namespace)
    }
}
