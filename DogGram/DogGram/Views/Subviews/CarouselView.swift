//
//  CarouselView.swift
//  DogGram
//
//  Created by Matteo on 24/04/2022.
//

import SwiftUI

struct CarouselView: View {
    @State var selection: Int = 0
    @State var timerAdded: Bool = false
    let maxCount: Int = 7
    
    var body: some View {
        TabView(selection: $selection, content: {
            ForEach((1...maxCount), id: \.self) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .animation(.default, value: selection)
        .onAppear(perform: {
            if !timerAdded {addTimer()}
        })
    }
    // MARK: FUNCTIONS
    
    func addTimer() {
        
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            
            switch(selection) {
            case maxCount:
                selection = 1
            default:
                selection += 1
            }
   
        }
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
