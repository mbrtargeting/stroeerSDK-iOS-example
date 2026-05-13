# Stroeer SDK – Ad Integration Examples for iOS

## Release Notes – 10.5.0

**Release Date:** 2026-05-12

### Highlights

- Added web-based debug pages.
- Updated OpenRTB display manager values:
  - `displaymanager`: `StroeerSDK`
  - `displaymanagerver`: `10.5.0`
- General bug fixes and stability improvements.

### Updated Third-Party Libraries

- **CMP:** `7.12.9`
- **Google Mobile Ads SDK:** `12.11.0`

---

## CocoaPods Distribution

Starting with version `10.5.0`, the CocoaPods distribution is separated into:

1. **Public CocoaPods distribution**
2. **Private CocoaPods distribution**

This separation allows the public release to use the latest supported Google Mobile Ads SDK version, while the private distribution continues to support integrations that require Gravite compatibility.

---

## Public CocoaPods Distribution

The public CocoaPods release of `YieldloveAdIntegration` includes the following subspecs:

- `Core`
- `Consent`

### Installation

```ruby
pod 'YieldloveAdIntegration', '10.5.0'
