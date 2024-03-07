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
                width = 10
                height = 10
                widthForFirst = 1
                heightForFirst = 1
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
                    .frame(width: 10, height: 10)
                    .offset(x: width + widthForFirst)

                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFill()
                    .opacity(1 - alpha)
                    .frame(width: 10.01 - width, height: 10.01 - height)
                    .offset(x: 10 + widthForFirst + width / 2)
            })
        }
    }
}

#Preview {
    ContentView()
}
