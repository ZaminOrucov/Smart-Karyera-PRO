import SwiftUI

struct ContentView: View {
    var body: some View {
            LoginView()
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15 Pro")
        
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}
