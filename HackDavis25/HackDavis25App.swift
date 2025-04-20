//
//  HackDavis25App.swift
//  HackDavis25
//
//  Created by Manushri Rane on 4/19/25.
//

import SwiftUI

@main
struct HackDavis25App: App {
    @State private var showSplash = true
    @State private var showSplash2 = true
    
    
    var body: some Scene {
        
        WindowGroup {
            
            if showSplash {
                ContentView().environmentObject(UserData())
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showSplash = false
                        }
                    }
            } else {
                
                LoginView()
                // questionnaire()
                //LoadingPage()
                // show splash to display loading page
                // Home()
                // Dashboard()
                // Click on timeline part - call Summarize.swift
                // click on the button at the bottom of this has link to doc filler
                // when clicked --> goes to document loading page
                // display final filled out form after
                /*
                if showSplash2 {
                    DocLoadingPage()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                showSplash2 = false
                            }
                        }
                } else {
                    DocFiller()
                }
                 */
                
            }
            
            
        }
    }
}
