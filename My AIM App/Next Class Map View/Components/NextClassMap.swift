//
//  NextClassMap.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 30/10/2022.
//

import SwiftUI
import MapKit

struct NextClassMap: View {
    @Binding var currentPage: CurrentPage
    
    var body: some View {
        ZStack {
            mapView()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Button {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            currentPage = .welcomeScreen
                        }
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("appButton"))
                        
                }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct mapView: UIViewRepresentable {
    
    func makeCoordinator() -> mapView.Coordinator {
        return mapView.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        let map = MKMapView()
        
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        
        let destinationCoordinates = CLLocationCoordinate2D(latitude: 12.9838, longitude: 80.2594)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
        sourcePin.title = "You"
        map.addAnnotation(sourcePin)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destinationCoordinates
        destinationPin.title = "Next Class"
        map.addAnnotation(destinationPin)
        
        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        
        map.region = region
        map.delegate = context.coordinator
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinates))
        
        let directions = MKDirections(request: req)
        
        directions.calculate { (direct, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
        }
        
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .orange
            render.lineWidth = 4
            return render
        }
    }
}


//struct mapView: UIViewRepresentable {
//
//    func makeCoordinator() -> mapView.Coordinator {
//        return mapView.Coordinator()
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
//        let map = MKMapView()
//
//        let sourceCoordinate = CLLocationCoordinate2D(latitude: 210.36, longitude: 96.65)
//
//        let destinationCoordinate = CLLocationCoordinate2D(latitude: 209.87, longitude: 97.55)
//
//        let sourcePin = MKPointAnnotation()
//        sourcePin.coordinate = sourceCoordinate
//        sourcePin.title = "You"
//        map.addAnnotation(sourcePin)
//
//        let destinationPin = MKPointAnnotation()
//        destinationPin.coordinate = destinationCoordinate
//        destinationPin.title = "You"
//        map.addAnnotation(destinationPin)
//
//        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
//
//        map.region = region
//        map.delegate = context.coordinator
//
//        let req = MKDirections.Request()
//        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
//        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
//
//        let directions = MKDirections(request: req)
//
//        directions.calculate { (direct, error) in
//            if error != nil {
//                print((error?.localizedDescription)!)
//                return
//            }
//            let polyline = direct?.routes.first?.polyline
//            map.addOverlay(polyline!)
//            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
//        }
//
//        return map
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
//
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            let render = MKPolylineRenderer(overlay: overlay)
//            render.strokeColor = UIColor(Color("appButton"))
//            render.lineWidth = 4
//            return render
//        }
//    }
//
//}
