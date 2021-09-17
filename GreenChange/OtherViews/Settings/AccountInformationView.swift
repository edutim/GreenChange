//
//  AccountInformationView.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-14.
//

import SwiftUI

struct AccountInformationView: View {
    
    @State var name = ""
    @State var accountID = ""
    @State var wallet = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Account Name")
                    .font(.title)
                Text(name)
                
                Divider()
                
                Text("Account ID")
                    .font(.headline)
                Text(accountID)
                    .font(.subheadline)
                Image(uiImage: generateQRCode(withID: name))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Divider()
                
                Text("GreenChange Points")
                    .font(.title)
                Text("\(wallet)")
            }
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Button("Delete Account") {
                    UserDefaults.standard.removeObject(forKey: "accountName")
                    name = ""
                    UserDefaults.standard.removeObject(forKey: "accountID")
                    accountID = ""
                    UserDefaults.standard.removeObject(forKey: "wallet")
                    wallet = 0
                    
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.red)
                .clipShape(Capsule())
                Spacer()

            }
            Spacer()
            
            
        }
        .padding()
        .navigationTitle("Account Info")
        .onAppear() {
            getAccountInfo()
        }
        
    }
    
    func getAccountInfo() {
        let ud = UserDefaults.standard
        guard let accountName = ud.object(forKey: "accountName") else {
            print("No account found on device.")
            
            return
        }
        
        name = UserDefaults.standard.string(forKey: "accountName")!
        accountID = UserDefaults.standard.string(forKey: "accountID")!
        wallet = UserDefaults.standard.integer(forKey: "wallet")
    }
    
    func generateQRCode(withID: String) -> UIImage {
        let data = withID.data(using: String.Encoding.ascii)

            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 20, y: 20)

                if let output = filter.outputImage?.transformed(by: transform) {
                    if let newImage = convert(output) {
                        return newImage
                    }
                }
            }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
//        let data = Data(string.utf8)
//        filter.setValue(data, forKey: "inputMessage")
//
//        if let outputImage = filter.outputImage {
//            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//                return UIImage(cgImage: cgimg)
//            }
//        }
//
//        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    private func convert(_ cmage:CIImage) -> UIImage? {
        let context:CIContext = CIContext(options: nil)
        guard let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent) else { return nil }
        let image:UIImage = UIImage(cgImage: cgImage)
        return image
    }
}

struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
    }
}
