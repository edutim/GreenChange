//
//  WalletViewModel.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-07.
//

import Foundation
import CoreImage
import UIKit

class WalletViewModel: ObservableObject {

    static var shared = WalletViewModel()
    
    @Published var showNewAccount = false
    
    @Published var activeAccount: Account = Account(id: UUID(), name: "") 
        
    @Published var newAccountCreated = false
    @Published var accountUpdated = false
    
    func getAccount() {
        //check if there is an account already in user defaults
        let ud = UserDefaults.standard
        guard let accountName = ud.object(forKey: "accountName") else {
            print("No account found on device.")
            showNewAccount = true
            return
        }
        
        let name = UserDefaults.standard.string(forKey: "accountName")!
        let id = UserDefaults.standard.string(forKey: "accountID")!
        let wallet = UserDefaults.standard.integer(forKey: "wallet")
        
        activeAccount = Account(id: UUID(uuidString: id)!, name: name)
        activeAccount.wallet = wallet
        //if so, the return that account and ask the server for an updated total
        //if not, you'll have to create a new account
    }
    
    func createAccount(name: String) {
        guard let url = URL(string: "http://timBookPro.local:8080/createNewAccount/\(name)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let udata​ = data else { return }
            
            struct ServerResponse {
                var name: String
                var id: String
            }
            
            let userData = try! JSONDecoder().decode(ServerRespone.self, from: udata​)
            let newAccount = Account(id: UUID(uuidString: userData.id)!, name: name)
            
            DispatchQueue.main.sync {
                self.activeAccount = newAccount
                UserDefaults.standard.setValue(newAccount.name, forKey: "accountName")
                UserDefaults.standard.setValue(newAccount.id.uuidString, forKey: "accountID")
                UserDefaults.standard.setValue(newAccount.totalCoin, forKey: "wallet")
                self.newAccountCreated = true
            }
            
            
        }.resume()
    }
    
    func getWalletTotal() {
        guard let url = URL(string: "http://timBookPro.local:8080/accountBalance/\(activeAccount.id.uuidString)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let udata​ = data else { return }
            
            
            
            do {
                let userData = try JSONDecoder().decode(Balance.self, from: udata​)
                DispatchQueue.main.async {
                    guard let amount = Int(userData.amount) else { return }
                    self.activeAccount.wallet = amount
                    self.accountUpdated.toggle()
                }
                
            } catch {
                print(error)
            }
           
            
            
            
            
        }.resume()
    }
    
    
    
    func validateTranfer(amount: Int, from: UUID, to: UUID) {
        guard let url = URL(string: "http://timBookPro.local:8080/transfer/\(amount)/\(from.uuidString)/\(to.uuidString)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let udata​ = data else { return }
            
            do {
                let userData = try JSONDecoder().decode(TransferResponse.self, from: udata​)
                DispatchQueue.main.sync {
                    print("Transfer successful")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func generateQRCode() -> UIImage {
        let data = activeAccount.id.uuidString.data(using: String.Encoding.ascii)

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


struct ServerRespone: Codable {
    let name: String
    let id: String
}

struct Balance: Codable {
    var amount: String
}

struct Transfer: Codable {
    var from: String
    var to: String
}

struct TransferResponse: Codable {
    var status: String
}
