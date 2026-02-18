//
//  BannerView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct BannerViewUI: View {
    
    @State private var size1: CGSize = CGSize(width: 320, height: 50)
    @State private var size2: CGSize = CGSize(width: 320, height: 50)

    var body: some View {
        VStack {
            BannerViewRepresentable(
                slotId: "banner",
                onAdSize: { size in
                    self.size1 = size
                }
            )
            .frame(maxWidth: .infinity)
            .frame(height: size1.height)

            BannerViewRepresentable(
                slotId: "banner",
                onAdSize: { size in
                    self.size2 = size
                }
            )
            .frame(maxWidth: .infinity)
            .frame(height: size2.height)
        }
        .padding(.horizontal)
    }
}

#Preview {
    BannerViewUI()
        .modelContainer(for: Item.self, inMemory: true)
}
