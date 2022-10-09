//
//  RedeemPoints.swift
//  testListSUI001
//
//  Created by Amit Gupta on 10/9/22.
//

import SwiftUI

struct RedeemPointsView: View {
    
    @AppStorage("pointsCount") var pointCount=0
    
    var businessNames = ["Business 1", "Business 2", "Business 3","Business 4", "Business 5", "Business 6","Business 7", "Business 8", "Business 9","Business 10"]
    var businessImages = ["Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak"]
    var businessDescriptions = ["Biz A", "Biz B", "Biz C","Biz D", "Biz E", "Biz F","Biz G", "Biz H", "Biz I","Biz J"]
    var rewardItems = [ ["Activity 1A", "Activity1B","Activity 1C"],["Activity 2A", "Activity2B","Activity 2C"],["Activity 3A", "Activity3B","Activity 3C"],["Activity 4A", "Activity4B","Activity 4C"],["Activity 5A", "Activity5B","Activity 5C"],["Activity 6A", "Activity6B","Activity 6C"],["Activity 7A", "Activity7B","Activity 7C"],["Activity 8A", "Activity8B","Activity 8C"],["Activity 9A", "Activity9B","Activity 9C"],["Activity 10A", "Activity10B","Activity 10C"]]
    static var rewardPoints = [ "Activity 1A":1, "Activity1B":2,"Activity 1C":3,"Activity 2A":4, "Activity2B":5,"Activity 2C":6,"Activity 3A":7, "Activity3B":8,"Activity 3C":9,"Activity 4A":10, "Activity4B":11,"Activity 4C":12,"Activity 5A":13, "Activity5B":14,"Activity 5C":15,"Activity 6A":16, "Activity6B":17,"Activity 6C":18,"Activity 7A":19, "Activity7B":20,"Activity 7C":21,"Activity 8A":22, "Activity8B":23,"Activity 8C":24,"Activity 9A":25, "Activity9B":26,"Activity 9C":27,"Activity 10A":28, "Activity10B":29,"Activity 10C":30]
    
    
    var body: some View {
        VStack {
            Text("Available points: \(pointCount)")
                .font(.system(size:36))
            List {

              
                ForEach(businessNames.indices, id:\.self) { index in
                    RedeemPointsRow(imageName: businessImages[index], name: businessNames[index], description: businessDescriptions[index], activities:rewardItems[index])
                }
                
            }
            .listRowSeparator(.hidden)
        }
    }
}

struct RedeemPointsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RedeemPointsRow: View {
    var imageName: String
    var name: String
    var description: String
    var activities: [String]
    
    @AppStorage("pointsCount") var pointCount=0
    @State private var showOptions=false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                Text(description)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("Confirm activity", isPresented: $showOptions, titleVisibility: .visible) {
                        ForEach(activities, id: \.self) { activity in
                            Button(activity) {
                                if let points=RedeemPointsView.rewardPoints[activity] {
                                    print("Activity \(activity) redeemed \(points) points")
                                    pointCount-=points
                                    
                                }
                                
                                
                            }
                        }
                    }
    }
}

