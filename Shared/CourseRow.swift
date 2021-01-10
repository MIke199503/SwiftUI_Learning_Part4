//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/10.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment:.top   ) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template) // 显示模式
                .frame(width: 48, height: 48)
                .imageScale(.medium)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment:.leading, spacing: 4.0) {
                Text("SwiftUI")
                    .font(.subheadline)
                Text("Description")
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
