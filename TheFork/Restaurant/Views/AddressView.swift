//
//  AddressView.swift
//  TheFork
//
//  Created by Victor Socaciu on 28.11.2020.
//

import SwiftUI
import MapKit

struct AddressView: View {
    
    @Binding var location: MKCoordinateRegion
    let address: CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: $location, annotationItems: [address]) { item in
            MapPin(coordinate: address)
        }
        .frame(height: 300)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(location: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))), address: CLLocationCoordinate2D(latitude: 0, longitude: 0))
            .previewLayout(.sizeThatFits)
    }
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: UUID {
        return UUID()
    }
}
