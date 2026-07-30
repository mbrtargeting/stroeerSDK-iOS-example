//
//  BannerViewController.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import GoogleMobileAds
import YieldloveAdIntegration
import YieldloveAdIntegration_Consent
import ConsentViewController

class BannerViewController: UIViewController, YLBannerViewDelegate {
    var slotId: String = ""
    var onAdSize: ((CGSize) -> Void)?

    private var bannerView: YLBannerView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        print("[BANNER_LOAD] slot=\(slotId)")

        let bannerView = Yieldlove.instance.bannerAd(
            adSlotId: slotId,
            viewController: self,
            delegate: self
        )
        self.bannerView = bannerView
        view.addSubview(bannerView)
    }

    func getGAMRequest() -> AdManagerRequest {
        let request = AdManagerRequest()
        request.contentURL = "https://www.stroeer.de/"
        
        return request
    }

    func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        print("banner size = \(bannerView.getBannerSize())")
        onAdSize?(bannerView.getBannerSize())
    }

    func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        print("[BANNER_ERROR] slot=\(bannerView.bannerConfiguration.adSlotId) error=\(error.localizedDescription)")
    }

    func bannerViewWillPresentScreen(_ bannerView: YLBannerView) {
        print("PRESENTED!!! for \(bannerView.bannerConfiguration.adSlotId)")
    }

    func bannerViewWillDismissScreen(_ bannerView: YLBannerView) {
        print("DISMISSED!!! for \(bannerView.bannerConfiguration.adSlotId)")
    }

    func bannerViewDidDismissScreen(_ bannerView: YLBannerView) {
        print("DISMISSED!!! for \(bannerView.bannerConfiguration.adSlotId)")
    }

    func bannerViewDidRecordClick(_ bannerView: YLBannerView) {
        print("CLICKED!!! for \(bannerView.bannerConfiguration.adSlotId)")
    }

    func bannerViewDidRecordImpression(_ bannerView: YLBannerView) {
        print("IMPRESSION!!! for \(bannerView.bannerConfiguration.adSlotId)")
    }
}


extension BannerViewController : StroeerConsentPublisherDelegate {
    /// called when there's a consent Message to be shown or before the PM is shown
    func onSPUIReady(){
        
    }

    /// called when the consent ui is closed
    func onSPUIFinished(){
        
    }

    /// called when we finish getting the consent profile from SourcePoint's endpoints
    func onConsentReady(consents: SPUserData){
        
    }

    /// the `onError` function can be called at any moment during the SDKs lifecycle
    func onError(error: StroeerConsentError){
        
    }
    
    /// called when the user takes an action in the SP UI
    func onAction(action: SPAction) {
        
    }
}
