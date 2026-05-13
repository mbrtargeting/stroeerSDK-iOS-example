//
//  BannerView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct BannerViewUI : View
{
    @State private var size: CGSize = .zero
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            
            Spacer()
            
            BannerViewRepresentable(
                slotId: "banner",
                onAdSize: { size in
                    self.size = size
                }
            )
            .frame(width: size.width, height: size.height)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}


#Preview {
    BannerViewUI()
        .modelContainer(for: Item.self, inMemory: true)
}
