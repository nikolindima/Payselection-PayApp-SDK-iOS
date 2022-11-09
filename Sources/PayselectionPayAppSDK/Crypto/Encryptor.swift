//
//  Encryptor.swift
//  PayselectionPayAppSDK
//
//  Created by Alexander Kogalovsky on 25.10.22.
//

import Foundation
import WebKit


class Encryptor: NSObject {
    
    private var webView: WKWebView?
    private let jsMessageHandler = "jsMessageHandler"
    private let configuration = WKWebViewConfiguration()
    
    private var pubKey = ""
    private var message = ""
    private var onCryptogramFetched: ((String) -> Void)?
    
    func makeCryptogram(pubKey: String,
                        cardDetails: PaymentPrivateDetails,
                        completion: @escaping (String) -> Void) {
        self.pubKey = pubKey
        do {
            let message = try getJSONString(from: cardDetails)
            self.message = message
        } catch {
            return
        }
        intializeWebView()
        onCryptogramFetched = { [weak self] cryptogram in
            completion(cryptogram)
            self?.onCryptogramFetched = nil
        }
    }
            
    private func intializeWebView() {
        configuration.userContentController.add(self, name: jsMessageHandler)
        webView = WKWebView(frame: .zero, configuration: configuration)
        guard let webView else { return }
        webView.navigationDelegate = self
        guard let url = Bundle.module.url(forResource: "jssource", withExtension: "html") else {
            print("Can not find file jssource.html")
            return
        }
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    private func getJSONString(from object: Codable) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .withoutEscapingSlashes
        do {
            let data = try encoder.encode(object)
            return String(data: data, encoding: .utf8)!
        } catch {
            throw error
        }
    }
}

extension Encryptor: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("makeCryptogram('\(pubKey)','\(message)')")
    }
}

extension Encryptor: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == jsMessageHandler {
            guard let dict = message.body as? [String: AnyObject],
                  let cryptogram = dict["cryptogram"] as? String else {return }
            self.onCryptogramFetched?(cryptogram)
            webView?.stopLoading()
            webView = nil
        }
    }
}
