import SwiftUI

struct ContentView: View {
    @State private var textInput: String = ""
    @State var page: Int = 1
    
    var body: some View {
        if page == 1 {
            FrontView(page: $page)
        } else if page == 2 {
            IntroductionView(page: $page)
        } else if page == 3 {
            DescriptionView(page: $page)
        } else if page == 4 {
            InputView(page: $page, textInput: $textInput)
        } else if page == 5 {
            SimulationView(page: $page, textInput: $textInput)
        } else if page == 6 {
            LastView(page: $page)
        }
    }
}
