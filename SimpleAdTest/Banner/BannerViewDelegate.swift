import SwiftUI
import YieldloveAdIntegration
import GoogleMobileAds

class BannerViewDelegate: YLBannerViewDelegate {
    
    @Binding var bannerViewHeight: CGFloat
    
    private var adSlotId: String?
    
    weak var viewController: UIViewController?
    weak var adView: UIView?
    
    init(adSlotId: String, viewController: UIViewController, bannerViewHeight: Binding<CGFloat>) {
        self.adSlotId = adSlotId
        self.viewController = viewController
        self._bannerViewHeight = bannerViewHeight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        if let existingAdView = adView {
            existingAdView.removeFromSuperview()
            adView = nil
        }
        
        print("This ad is from \(bannerView.getSource())")
        
        if let adContainer = viewController?.view {
            adContainer.addSubview(bannerView)
            
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                bannerView.centerXAnchor.constraint(equalTo: adContainer.centerXAnchor),
                bannerView.centerYAnchor.constraint(equalTo: adContainer.centerYAnchor),
            ])
        }
        
        adView = bannerView
        
        DispatchQueue.main.async {
            self.$bannerViewHeight.wrappedValue = bannerView.frame.height
        }
    }
    
    public func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {
        // should test app show an error?
    }
    
    public func load()  {
         if let adSlot = adSlotId, let vc = viewController {
             Yieldlove.instance.bannerAd(
                adSlotId: adSlot,
                viewController: vc,
                delegate: self
             )
         }
     }
    
    func clearBanner() {
        adView?.removeFromSuperview()
        adView = nil
    }
    
    func getGAMRequest() -> AdManagerRequest {
        let publishersRequest = AdManagerRequest()
        publishersRequest.contentURL = "http://jobs.stroeer-labs.com"
        return publishersRequest
    }
}
