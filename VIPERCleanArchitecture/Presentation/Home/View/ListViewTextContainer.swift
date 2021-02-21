//
//  ListViewTextContainer.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import SwiftUI

struct ListViewTextContainer: View {
    var attribute: String
    var data: String
    
    var body: some View {
        HStack {
            Text("\(attribute)")
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(data)")
            }
        }.padding(.bottom, 2)
    }
}
