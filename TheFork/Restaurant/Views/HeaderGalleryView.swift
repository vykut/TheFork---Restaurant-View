//
//  HeaderGalleryView.swift
//  TheFork
//
//  Created by Victor Socaciu on 28.11.2020.
//

import SwiftUI

struct HeaderGalleryView: View {
    
    var images: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                    
                } // foreach
                .frame(height: 250)
            } // hstack
        } // scroll
        .overlay(
            VStack {
                HStack(spacing: 8) {
                    Button {
                        print("back: button pressed")
                    } label: {
                        Image(systemName: "chevron.left")
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(.black)
                                    .opacity(0.6)
                            )
                            .foregroundColor(.white)
                    } // button
                    Spacer()
                    Button {
                        print("share: button pressed")
                    } label: {
                        Image("share")
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(.black)
                                    .opacity(0.6)
                            )
                            .foregroundColor(.white)
                    } // button
                    Button {
                        print("favorites: button pressed")
                    } label: {
                        Image("solid-heart")
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(.black)
                                    .opacity(0.6)
                            )
                            .foregroundColor(.white)
                    } // button
                } // hstack
                .frame(alignment: .top)
                Spacer()
                HStack {
                    Button {
                        print("see all photos: button pressed")
                    } label: {
                        HStack {
                            Text("See all \(images.count) photos")
                            Image(systemName: "chevron.right")
                        }
                    } // button
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.black)
                            .opacity(0.6)
                    )
                    Spacer()
                } // hstack
                .foregroundColor(.white)
                
            } // vstack
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding(8)
            .padding(.top, 28)
        )
    }
}

struct HeaderGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGalleryView(images: [UIImage]())
    }
}
