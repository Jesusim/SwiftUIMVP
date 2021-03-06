//
//  CreateNewMoviesView.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 02.02.2022.
//

import SwiftUI

struct CreateNewMoviesView: View {
    
    @ObservedObject var presenter: CreateNewMoviesPresenter
    @State private var showingImagePicker = false
    
    init(
        presenter: CreateNewMoviesPresenter
    ) {
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    Text("Movie title:")
                    TextField("Put here title", text: $presenter.title)
                        .padding([.top, .bottom, .trailing], 8)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal, 5)
                VStack(alignment: .center) {
                    Text("Movie description:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextEditor(text: $presenter.description)
                        .padding(.bottom)
                        .frame(height: 400.0)
                        .disableAutocorrection(true)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray, lineWidth: 1)
                        }
                }
                .padding([.leading, .bottom, .trailing], 5)
                HStack(alignment: .top) {
                    Button("Upload poster to movie") {
                        showingImagePicker = true
                    }
                    .padding()
                    .frame(height: 50.0)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    NavigationButton(contentView: imageView) { isPresented in
                        presenter.openImageForFullScreen(isPresented, image: $presenter.image)
                    }
                }
                NavigationLink(destination: DetailView()) {
                    Label("Work Folder", systemImage: "folder")
                }
            }
            .navigationTitle("Create movies")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $presenter.image)
            }
        }
    }
    
    var imageView: some View {
        Image(uiImage: presenter.image ?? UIImage())
            .resizable()
            .frame(width: 50.0, height: 50.0)
            .border(.gray)
    }
}
