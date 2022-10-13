//
//  GoodDeedView.swift
//  testListSUI001
//
//  Created by Amit Gupta on 10/9/22.
//

import SwiftUI

struct GoodDeedView: View {
    
    @AppStorage("pointsCount") var pointCount=0
    
    var deedNames = ["UNSD 1", "UNSD 2", "UNSD 3","UNSD 4", "UNSD 5", "UNSD 6","UNSD 7", "UNSD 8", "UNSD 9","UNSD 10"]
    var deedImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso","Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso"]
    var deedDescriptions = ["Desc A", "Desc B", "Desc C","Desc D", "Desc E", "Desc F","Desc G", "Desc H", "Desc I","Desc J", "Desc A", "Desc B", "Desc C","Desc D", "Desc E", "Desc F","Desc G", "Desc H", "Desc I","Desc J"]
    var deedActivities = [ ["Activity 1A", "Activity1B","Activity 1C"],["Activity 2A", "Activity2B","Activity 2C"],["Activity 3A", "Activity3B","Activity 3C"],["Activity 4A", "Activity4B","Activity 4C"],["Activity 5A", "Activity5B","Activity 5C"],["Activity 6A", "Activity6B","Activity 6C"],["Activity 7A", "Activity7B","Activity 7C"],["Activity 8A", "Activity8B","Activity 8C"],["Activity 9A", "Activity9B","Activity 9C"],["Activity 10A", "Activity10B","Activity 10C"],["Activity 11A", "Activity11B","Activity 11C"],["Activity 12A", "Activity12B","Activity 12C"],["Activity 13A", "Activity13B","Activity 13C"],["Activity 14A", "Activity14B","Activity 14C"],["Activity 15A", "Activity15B","Activity 15C"],["Activity 16A", "Activity16B","Activity 16C"],["Activity 17A", "Activity17B","Activity 17C"]]
    static var deedPoints = [ "Activity 1A":1, "Activity1B":2,"Activity 1C":3,"Activity 2A":4, "Activity2B":5,"Activity 2C":6,"Activity 3A":7, "Activity3B":8,"Activity 3C":9,"Activity 4A":10, "Activity4B":11,"Activity 4C":12,"Activity 5A":13, "Activity5B":14,"Activity 5C":15,"Activity 6A":16, "Activity6B":17,"Activity 6C":18,"Activity 7A":19, "Activity7B":20,"Activity 7C":21,"Activity 8A":22, "Activity8B":23,"Activity 8C":24,"Activity 9A":25, "Activity9B":26,"Activity 9C":27,"Activity 10A":28, "Activity10B":29,"Activity 10C":30,"Activity 11A":1, "Activity11B":2,"Activity 11C":3,"Activity 12A":4, "Activity12B":5,"Activity 12C":6,"Activity 13A":7, "Activity13B":8,"Activity 13C":9,"Activity 14A":10, "Activity14B":11,"Activity 14C":12,"Activity 15A":13, "Activity15B":14,"Activity 15C":15,"Activity 16A":16, "Activity16B":17,"Activity 16C":18,"Activity 17A":19, "Activity17B":20,"Activity 17C":21,]
    
    
    var body: some View {
        VStack {
            Text("Current points: \(pointCount)")
                .font(.system(size:40))
            List {

              
                ForEach(deedNames.indices, id:\.self) { index in
                    GoodDeedRow(imageName: deedImages[index], name: deedNames[index], description: deedDescriptions[index], activities:deedActivities[index])
                }
                
            }
            .listRowSeparator(.hidden)
        }
    }
}

struct GoodDeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GoodDeedRow: View {
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
                                if let points=GoodDeedView.deedPoints[activity] {
                                    print("Activity \(activity) led to \(points) points")
                                    pointCount+=points
                                    
                                }
                                
                                
                            }
                        }
                    }
    }
}
