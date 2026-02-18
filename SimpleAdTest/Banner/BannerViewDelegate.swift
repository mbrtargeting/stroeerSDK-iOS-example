import SwiftUI
import YieldloveAdIntegration
import GoogleMobileAds

final class BannerViewDelegate: YLBannerViewDelegate {

    private weak var viewController: UIViewController?
    private var onAdSize: ((CGSize) -> Void)?

    init(viewController: UIViewController, onAdSize: ((CGSize) -> Void)? = nil) {
        self.viewController = viewController
        self.onAdSize = onAdSize
    }

    func bannerViewDidReceiveAd(_ bannerView: YLBannerView) {
        guard let vc = viewController else { return }

        // Removing any old banners
        vc.view.subviews
            .compactMap { $0 as? YLBannerView }
            .forEach { $0.removeFromSuperview() }

        bannerView.removeFromSuperview()

        vc.view.addSubview(bannerView)

        bannerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            bannerView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])

        Yieldlove.instance.resizeBanner(banner: bannerView) { [weak self] in
            bannerView.layoutIfNeeded()
            self?.onAdSize?(bannerView.getBannerSize())
        }
    }

    func bannerView(_ bannerView: YLBannerView, didFailToReceiveAdWithError error: Error) {}

    func getGAMRequest() -> AdManagerRequest {
        let req = AdManagerRequest()
        req.contentURL = "http://jobs.stroeer-labs.com"
        return req
    }
}

