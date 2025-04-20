import SwiftUI

struct WelcomeView: View {
    @State private var name: String = "OnBoard"

    var body: some View {
        ZStack {
            Color(red: 0.25, green: 0.4, blue: 0.7)
                .ignoresSafeArea()

            FlightPathView()

            VStack(spacing: 8) {
                Spacer()

                Text("Welcome to")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.white)

                Text(name)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)

                Spacer()
            }

            // Airplane icon
            VStack {
                HStack {
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-23  ))
                        .padding(.leading, 82)
                        .padding(.top, 90)

                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct FlightPathView: View {
    var body: some View {
        ZStack {
            // top curved paths
            ArcPath(startAngle: 160, endAngle: 20, radius: 300)
                .stroke(style: StrokeStyle(lineWidth: 6, dash: [14, 10]))
                .foregroundColor(.white)
                .offset(y: -80)

            ArcPath(startAngle: 160, endAngle: 20, radius: 260)
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [12, 12]))
                .foregroundColor(.white)
                .offset(y: -40)
            
            ArcPath(startAngle: 160, endAngle: 20, radius: 240)
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [10, 8]))
                .foregroundColor(.white)
                .offset(y: 10 )

            // bottom curved paths
            ArcPath(startAngle: -20, endAngle: -160, radius: 300)
                .stroke(style: StrokeStyle(lineWidth: 6, dash: [14, 10]))
                .foregroundColor(.white)
                .offset(y: 80)

            ArcPath(startAngle: -20, endAngle: -160,radius: 260)
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [12, 12]))
                .foregroundColor(.white)
                .offset(y: 60)
            
            ArcPath(startAngle: -20, endAngle: -160,  radius: 240)
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [10, 8]))
                .foregroundColor(.white)
                .offset(y: 10 )
            
        }
    }
}

struct ArcPath: Shape {
    var startAngle: Double
    var endAngle: Double
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)

        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(endAngle),
            clockwise: false
        )

        return path
    }
}

struct ContentView: View {
    var body: some View {
        WelcomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
