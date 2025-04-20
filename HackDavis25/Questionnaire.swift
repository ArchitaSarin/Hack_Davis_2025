import SwiftUI

struct Questionnaire: View {
    @State private var currentStep = 0
    @State private var name = ""
    @State private var age = ""
    @State private var country = ""
    @State private var visaType = ""
    @State private var visitReason = ""
    let blueCol = Color(red: 0.53, green: 0.70, blue: 0.93)
    let greenCol = Color(red: 0.729, green: 0.875, blue: 0.741)
    let darkBlueCol = Color(red: 0.25, green: 0.4, blue: 0.7)
    @State private var profileCreated = false
    

    let questions = ["What is your name?",
                     "How old are you?",
                     "What country are you from?",
                     "What type of visa do you have?",
                     "When are you aiming to get to the U.S?",
                        "What is the reason for your visit?"]

    var body: some View {
        
        ZStack {
            LinearGradient(
                        gradient: Gradient(colors: [blueCol, .white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Text("Let’s Get to Know You")
                    .font(.largeTitle)
                    .foregroundColor(darkBlueCol)
                    .bold()

                Text(questions[currentStep])
                    .font(.headline)
                    .padding()

                TextField("Enter your answer", text: bindingForCurrentStep())
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(blueCol, lineWidth: 4)
                    )
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding()
                    .padding()

                Button(action: {
                    if currentStep < 5 {
                        currentStep += 1
                        
                    } else {
                        profileCreated = true
                        print("All responses collected!")
                        
                    }
                }){
                    Text(currentStep < 4 ? "Next" : "Submit")
                        .foregroundColor(.white)
                        .bold(true)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(darkBlueCol)
                        .cornerRadius(10)
                        .padding(.horizontal, 90)
                }
                
            }
            .padding()
            .navigationDestination(isPresented: $profileCreated) {
                MultiTimelineView()
            }
        }
    }

    // Binds the TextField to the correct property
    private func bindingForCurrentStep() -> Binding<String> {
        switch currentStep {
        case 0: return $name
        case 1: return $age
        case 2: return $country
        case 3: return $visaType
        case 4: return $visitReason
        default: return .constant("")
        }
    }
}
#Preview
{
    Questionnaire()
    
}
