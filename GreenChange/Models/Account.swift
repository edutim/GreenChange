//
//  Wallet.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-09-07.
//

import Foundation

class Account: Codable, Identifiable, CustomStringConvertible, ObservableObject {
    var id: UUID
    var name: String
    var wallet: Int = 0
    var totalCoin: Int {
        get {
            return wallet
        }
    }
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
        //self.wallet =
    }
    
    var description: String {
        return "Name: \(name). Coins: \(totalCoin)."
    }
    
    func accountAsJsonData() -> Data? {
        var encoder = JSONEncoder()
        
        do {
            let json = try encoder.encode(self)
            return json
        } catch {
            print("Could not encode Account data.")
        }
        return nil
        
    }
    
    
    func acceptTransfer(coins: Int) {
            
    }
}
