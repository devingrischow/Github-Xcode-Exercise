//
//  ContentView.swift
//  Github-Xcode-Exercise
//
//  Created by Devin Grischow on 2/20/24.
//

import SwiftUI

let tabBarItems:[TabChoices] = [.view1, .view2]

struct ContentView: View {
    
    //View Options For Tab Bar

    //State For Selected Tab, Starts at
    @State var selectedTab:TabChoices = .view1

    
    var body: some View {
        GeometryReader{ geometry in
            TabView(selection: $selectedTab){
                TeamElevate().tag(TabChoices.view1)
                //SampleView2().tag(TabChoices.view2)
                TeamSlate().tag(TabChoices.view2)
            }//Bottom of Tab View
            .overlay(alignment: .bottom){
                TeamChoicesTabBar(selectedTab: $selectedTab, viewWidth: geometry.size.width - 30)//To get the effect of the tab bar being smaller than the phone, take the screen width (393 on iphone 15 pro) and subtract 30 from the size, this it to allow for easier resizing on any phone
            }
            
        }
    }
}

#Preview {
    ContentView()
}


enum TabChoices:String, Identifiable{
    case view1 = "line.diagonal.arrow"
    case view2 = "line.diagonal"
    
    var id: Self { return self }
}
