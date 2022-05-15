//
//  ContentView.swift
//  NavigationLinkFormEditModeIssue
//
//  Created by Gene Bogdanovich on 15.05.22.
//

import SwiftUI

struct ImageModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State var images: [ImageModel] = [
        ImageModel(name: "Image"),
        ImageModel(name: "Image")
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink("Subtasks") {
                        Text("Subtasks")
                    }
                }
                
                Section {
                    Button("Add Image") {
                        withAnimation {
                            images.append(ImageModel(name: "Image"))
                        }
                    }
                    ForEach(images) { image in
                        Text(image.name)
                    }
                    .onMove(perform: { _, _ in })
                    .onDelete(perform: { _ in })
                }
                
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .environment(\.editMode, .constant(.active))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
