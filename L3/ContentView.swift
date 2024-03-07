import SwiftUI

struct ContentView: View {
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    @State var widthForFirst: CGFloat = 0
    @State var heightForFirst: CGFloat = 0
    @State var alpha: CGFloat = 0

    var body: some View {
        Button {
            withAnimation(.linear(duration: 0.3)){
                alpha = 1
                width = 100
                height = 100
                widthForFirst = 10
                heightForFirst = 10
            } completion: {
                withAnimation(.linear(duration: 0.1)){
                    widthForFirst = 0
                    heightForFirst = 0
                } completion: {
                    alpha = 0
                    width = 0
                    height = 0
                }
            }
        } label: {
            ZStack(content: {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFill()
                    .opacity(alpha)
                    .frame(width: width + widthForFirst, height: height + heightForFirst)

                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .offset(x: width + widthForFirst)

                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFill()
                    .opacity(1 - alpha)
                    .frame(width: 100.01 - width, height: 100.01 - height)
                    .offset(x: 100 + widthForFirst + width / 2)
            })
            .offset(x: -40)
            .padding(100)
        }
    }
}

#Preview {
    ContentView()
}
