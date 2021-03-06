//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/10.
//

import SwiftUI

struct CourseRow: View {
    var item:CourseSection = courseSections[0]
    var body: some View {
        HStack(alignment:.top   ) {
            Image(item.logo)
                .renderingMode(.original) // 显示模式
                .frame(width: 48, height: 48)
                .imageScale(.medium)
                .background(item.color)
                .clipShape(Circle())
            VStack(alignment:.leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        
        
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
            .preferredColorScheme(.dark)
    }
}
