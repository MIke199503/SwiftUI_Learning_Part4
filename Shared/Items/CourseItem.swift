//
//  CourseItem.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/11.
//

import SwiftUI

struct CourseItem: View {
    var course:Course = courses[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                Spacer()
            }
                
            Text(course.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(Color.white)
            
            
        }
        .padding(.all)
        .background(course.color)
//        .cornerRadius(20)
        .clipShape(RoundedRectangle(cornerRadius: 22,style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
