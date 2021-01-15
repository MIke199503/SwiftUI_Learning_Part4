//
import SwiftUI

struct  test :View {
    var body: some View{
        let columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                }
            }.font(.largeTitle)
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
       test()
    }
}

