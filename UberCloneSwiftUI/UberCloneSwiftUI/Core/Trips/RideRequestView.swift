import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType = RideType.uberX
    
    var body: some View {
        HStack {
            VStack {
                Capsule()
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 48, height: 6)
                    .padding(.vertical)
                
                // trip info view
                
                HStack {
                    HStack {
                        VStack {
                            Circle()
                                .fill(Color(.systemGray3))
                                .frame(width: 6, height: 6)
                            
                            Rectangle()
                                .fill(Color(.systemGray3))
                                .frame(width: 1, height: 24)
                            
                            Rectangle()
                                .fill(.black)
                                .frame(width: 6, height: 6)
                        }
                    }
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Text("Current location")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("1:30 PM")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Starbucks location")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("1:45 PM")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                
                Divider()
                
                // ride type selection view
                
                Text("SUGGESTED RIDES")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(RideType.allCases, id: \.self) { rideType in
                            VStack(alignment: .leading) {
                                Image(rideType.imageName)
                                    .resizable()
                                    .scaledToFit()
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(rideType.description)
                                        .font(.system(size: 14, weight: .semibold))
                                    Text("$22.04")
                                        .font(.system(size: 14, weight: .semibold))
                                }.padding()
                            }
                            .frame(width: 112, height: 140)
                            .foregroundColor(rideType == selectedRideType ? .white : .black)
                            .background(Color(rideType == selectedRideType ? .systemBlue : .systemGroupedBackground))
                            .scaleEffect(rideType == selectedRideType ? 1.2 : 1.0)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedRideType = rideType
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 8)
                
                // payment option view
                
                HStack(spacing: 12) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(.blue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                        .padding(.leading)
                    
                    Text("**** 1234")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                }
                .frame(height: 50)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // request ride button
                Button {
                    
                } label: {
                    Text("CONFIRM RIDE")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 16)
            .background(.white)
            .cornerRadius(16)
        }
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
