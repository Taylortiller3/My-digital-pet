import SwiftUI  

struct ContentView: View {  
    // ADD ABOVE var body  
    @State private var hungerLevel = 5  
    @State private var happinessLevel = 8  
    @State private var energyLevel = 7  
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()  
    
    
    var body: some View {  
        
        
        
        ZStack {
            
            // All layers go here! 
            
            // BACKGROUND (First = Bottom)  
            Image("purpleBackground")  
                .resizable()  
                .ignoresSafeArea() // Fill entire screen 
            // PET (Second Layer)  
            Image("dogc")  
                .resizable()  
                .frame(width: 500, height: 500)
            // STATUS (Top Layer)  
            VStack(alignment: .leading) { // Left-align text
                Text("Hunger: \(hungerLevel)/10")
                    .font(.headline)
                Text("Happiness: \(happinessLevel)/10")
                    .font(.headline)
                Text("Energy: \(energyLevel)/10")
                    .font(.headline)
            }.padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.top, 40)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading) // Stick to top-left
            .padding(.top, 40) 
            
            
            
            
            
            VStack {  
                
                Spacer() // Push to bottom  
                HStack {  
                    Button("Feed 🍎") {  
                        hungerLevel = min(hungerLevel + 1, 10) // Never go over 10 
                    }  
                    Button("Play 🎾") {  
                        happinessLevel = min(happinessLevel + 1, 10) // Never go over 10 
                    } 
                    Button("Nap 😴") {
                        energyLevel = min(energyLevel + 1, 10) // Never go over 10 
                    } 
                }  
            }  
            
            
        }.onReceive(timer) { _ in  
            hungerLevel = max(hungerLevel - 1, 0)
            let randomStat = Int.random(in: 0...2) 
            
            switch randomStat {
            case 0:
                hungerLevel = max(hungerLevel - 1, 0)
            case 1:
                happinessLevel=max(happinessLevel-1,0 )
            default:
                energyLevel = max(energyLevel - 1, 0)
                
                
            }
        }
        
    }
}
  
