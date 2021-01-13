//
//  CousesView.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/10.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    var body: some View{
        ZStack {
            ScrollView {
                VStack {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace,isSource: !show)
                            //这里的matchedgeometryEffect 我觉得就跟PPT中的平滑移动很类似，id的话，就是匹配，从谁变到谁，然后in的话，我的理解，就是一个空间用来变换的。然后issource就是谁是根试图，也就是从谁那里变得。
                            .frame(width: 335, height: 250)
                    }

                }
                .frame(maxWidth:.infinity)
            }
            
            if show {
                ScrollView {
                    CourseItem(course: courses[3])
                        .matchedGeometryEffect(id: courses[3].id, in: namespace)
                        .frame(height:300)
                    VStack{
                        ForEach( 0 ..< 20 ){ item in
                            CourseRow()
                        }
                    }
                    .padding()
                    
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                                    .opacity
                                    .animation(
                                        Animation.spring()
                                            .delay(0.3)
                                    ),
                        removal: AnyTransition
                            .opacity
                            .animation(.spring()))
                    
                )
                .edgesIgnoringSafeArea(.all)
                //                        .zIndex(1)//防止遮挡
                //这里的transition，我的理解是当你的view和animation链接，然后按照特定的方式出现。
                //使用透明度来过渡，并且在过渡的时候，添加一个Spring效果。并且有延迟。
                //.asymmetric 就是分开来处理。因为如果同时处理的话，推出的时候，延迟效果没必要，大可不必，兄弟。
            }
            
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
        //        .animation(.spring())// 这里不实用外置的animation是因为会有拖影，但是在里面就不会。
        
    }
}

struct CousesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
