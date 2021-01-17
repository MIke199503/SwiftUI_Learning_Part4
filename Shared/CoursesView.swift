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
    @State var selectedItem:Course? = nil //点击的是谁，谁变大
    @State var isDisabled = false
    
    var body: some View{
        ZStack {
            ScrollView() {
                //关于lazyVgrid，用行与列来排布内容，在vGrid时，gridItem就是代表一列。再多写一个，就多一列。
                //adaptive 在给定的空间自动适应，minimun最小尺寸
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 16)],spacing:16) {
                    //第二种写法，使用列表的repeat写法
                    //                LazyVGrid(
                    //                    columns: Array(repeating: .init(.flexible(),spacing:16), count: 3),
                    //                    spacing:16
                    //                ) {
                    
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace,isSource: !show)
                                //这里的matchedgeometryEffect 我觉得就跟PPT中的平滑移动很类似，id的话，就是匹配，从谁变到谁，然后in的话，我的理解，就是一个空间用来变换的。然后issource就是谁是根试图，也就是从谁那里变得。
                                .frame(height: 200)
                                //将OntapGesture放在这里是为了对应每个card
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0)) {
                                        self.show.toggle()
                                        self.selectedItem = item
                                        self.isDisabled = true
                                    }
                                }
                                .disabled(self.isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace,isSource: !show)
                    }
                }
                .padding(10)
                .frame(maxWidth:.infinity)
            }
            .zIndex(1)
            
            if selectedItem != nil   {
                ZStack(alignment:.topTrailing){
                    //这里使用toptrailing 是为了让关闭按钮出现在右上角
                    CourseDetail(course:selectedItem!,namespace: namespace)
                    
                    
                    
                    CloseButton()
                        .onTapGesture {
                            withAnimation(.spring()) {
                                self.show.toggle()
                                self.selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ){
                                    self.isDisabled = false
                                }
                            }
                        }

                }
                .zIndex(2)
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
