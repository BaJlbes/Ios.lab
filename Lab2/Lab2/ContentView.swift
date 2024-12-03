
import SwiftUI
struct ContentView: View {
    @State private var name: String = "Bohdan"
    @State private var surname: String = "Tulin"
    @State private var age: String = "19"
    @State private var profession: String = "Programmer"
    @State private var hobbies: String = "Sports"
    @State private var city: String = "Stryi"
    
    var body: some View {
        ZStack {
            // Градієнт як фон
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            
            VStack(alignment: .center) {
                // Заголовок та аватарка
                ScrollView {
                    VStack {
                        
                 Image("Img")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.black)
                            .padding()
                            .clipShape(Circle())
                            .shadow(radius: 10)

                        
                        Text("My profile")
                            .font(.title) // Зменшуємо розмір шрифту
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .shadow(radius: 10)

                    }
                    .padding(.bottom, 20)
                    
                    // Основна інформація
                    VStack(alignment: .leading, spacing: 15) {
                        VStack{
                            HStack {
                                Text("Name:")
                                    .frame(maxWidth: . infinity, alignment: .trailing)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                                Text(name)
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                            
                            HStack {
                                Text("Age:")
                                    .frame(maxWidth: . infinity, alignment: .trailing)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                                Text("\(age) years")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        
                        HStack {
                            Text("Profession:")
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Spacer()
                            Text(profession)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Text("City:")
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Spacer()
                            Text(city)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Text("Hobby:")
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Spacer()
                            Text(hobbies)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
}
                    
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    // Роздільна лінія
                    Divider()
                        .background(Color.white)
                    
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
