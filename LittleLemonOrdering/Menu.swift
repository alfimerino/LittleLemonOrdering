//
//  Menu.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.title, ascending: true)],
        animation: .default)
    private var dishes: FetchedResults<Dish>
    @State private var selected = "all"
    @State private var searchText = ""
    
    
    private var responseString = ""
    @State private var menuData: MenuList?
    @State private var errorMessage: String?
    
    private var filteredDishes: [Dish] {
            if searchText.isEmpty && selected == "all" {
                return Array(dishes)
            } else {
                return dishes.filter { dish in
                    let nameMatch = searchText.isEmpty || dish.title?.localizedCaseInsensitiveContains(searchText) ?? false
                    let categoryMatch = selected == "all" || dish.category == selected
                    return nameMatch && categoryMatch
                }
            }
        }
    
    var body: some View {
        NavigationView {
            VStack {
                MenuHeader()
                SearchBar(text: $searchText)
                    .padding([.horizontal, .top], 6)
                HStack {
                    Text("Order for Delivery")
                        .font(.title3)
                        .bold()
                    Spacer()
                }.padding(.leading)
                HStack {
                    Text("Filter by:")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                    Spacer()
                }.padding(.leading)
                Picker(selection: $selected, label: Text("Favorite Color")) {
                                Text("All").tag("all")
                                Text("Starters").tag("starters")
                                Text("Mains").tag("mains")
                                Text("Desserts").tag("desserts")
                }
                .pickerStyle(.palette)
                .padding(.horizontal, 8)
                List {
                    ForEach(Array(filteredDishes.enumerated()), id: \.element.id) { index, dish in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dish.title ?? "unknown dish")
                                Text(("$\(dish.price ?? "00").00"))
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                        }
                    }
                }
                .listStyle(.inset)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("little-lemon-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
            }.onAppear {
                deleteAllItems()
                getMenuData()
            }
        }
    }
    
    private func deleteAllItems() {
        dishes.forEach { viewContext.delete($0) }
        do {
            try viewContext.save()
        } catch {
            print("Error saving context after resetting dishes: \(error)")
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.errorMessage = "Invalid response"
                return
            }
            
            guard let data = data else {
                self.errorMessage = "No data received"
                return
            }
            
            do {
                let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
                DispatchQueue.main.async {
                    self.menuData = fullMenu
                    if let menu = self.menuData?.menu {
                        for item in menu {
                            
                            let newItem = Dish(context: viewContext)
                            newItem.title = item.title
                            newItem.price = item.price
                            newItem.image = item.image
                            newItem.category = item.category
                        }
                    }
                    do {
                        try viewContext.save()
                    } catch (let error) {
                        print(error.localizedDescription)
                    }
                }
            } catch {
                self.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        }.resume()
    }
}

#Preview {
    Menu()
}
