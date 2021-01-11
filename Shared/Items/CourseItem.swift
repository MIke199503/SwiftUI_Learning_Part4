//
//  CourseItem.swift
//  DesignCodeCourse
//
//  Created by 朱桃禾 on 2021/1/11.
//

import SwiftUI

struct CourseItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                Spacer()
                Image("Illustration 1")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                Spacer()
            }
                
            Text("SwiftUI for Ios 14")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            
            Text("20 Sections")
                .font(.footnote)
                .foregroundColor(Color.white)
            
            
        }
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
