import SwiftUI
import Firebase

@main
struct XBlogApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ThemeManager())
        }
    }
}

// MARK: - Theme Manager

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false

    var currentTheme: ColorScheme {
        isDarkMode ? .dark : .light
    }
}

// MARK: - Main View

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        NavigationView {
            HomeView()
        }
        .preferredColorScheme(themeManager.currentTheme)
    }
}

// MARK: - Home View

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HeaderView()

                BlogCardView(title: "JJK Black Hunt",
                             description: "En-tangle in the JJK Sorcery Blog: Black Hunt.",
                             imageName: "Black_Hunt",
                             episode: "01",
                             color: .black)

                BlogCardView(title: "JJK Crimson Red",
                             description: "En-tangle in the JJK Sorcery Blog: Crimson Red.",
                             imageName: "Crimson_Red",
                             episode: "02",
                             color: .red)

                BlogCardView(title: "JJK Styled Brown",
                             description: "En-tangle in the JJK Sorcery Blog: Styled Brown.",
                             imageName: "Stylish_Brown",
                             episode: "03",
                             color: .brown)
            }
            .padding()
        }
    }
}

// MARK: - Header

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("X")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)

            Spacer()

            NavigationLink(destination: HomeView()) {
                Image(systemName: "house.fill")
                    .font(.title)
                    .foregroundColor(.primary)
            }
        }
    }
}

// MARK: - Blog Card

struct BlogCardView: View {
    let title: String
    let description: String
    let imageName: String
    let episode: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .rotationEffect(.degrees(-90))
                    .font(.title2)
                    .frame(width: 50)
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }

            HStack {
                VStack {
                    Text(episode)
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Rectangle()
                        .frame(width: 2, height: 50)
                        .foregroundColor(.white)
                }
                .frame(width: 50)
                .background(color)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Blog:")
                        .font(.headline)
                    Text(description)
                        .font(.subheadline)

                    NavigationLink(destination: DetailView()) {
                        Text("Read More")
                            .font(.body)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.primary, lineWidth: 1)
                            )
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - Detail View

struct DetailView: View {
    var body: some View {
        Text("Blog details go here.")
            .padding()
    }
}
