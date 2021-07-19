//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Filip Baumgart on 19/07/2021.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var order: Order
  @State private var alertMessage = ""
  @State private var showingAlert = false
  @State private var alert: Alert!
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image("cupcakes")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width)
          
          Text("Your total is $\(self.order.cost, specifier: "%.2f")")
            .font(.title)
          
          Button("Place Order") {
            placeOrder()
          }
          .padding()
        }
      }
    }
    .alert(isPresented: $showingAlert) {
      alert
    }
    .navigationBarTitle("Check out", displayMode: .inline)
  }
  
  func placeOrder() {
    guard let encoded = try? JSONEncoder().encode(order) else {
      print("Failed to encode order")
      return
    }
    let url = URL(string: "https://reqres.in/api/cupcakes")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = encoded
    URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
        alertMessage = "Something went wrong! Try again."
        alert = createAlert(success: false)
        self.showingAlert = true
        return
      }
      if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
        self.alertMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
        alert = createAlert(success: true)
        self.showingAlert = true
      } else {
        print("Invalid response from server")
      }
    }.resume()
  }
  
  private func createAlert(success: Bool) -> Alert {
    success ? Alert(title: Text("Thank you!"), message: Text(alertMessage), dismissButton: .default(Text("OK"))) :
      Alert(title: Text("Ooops!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(order: Order())
  }
}
