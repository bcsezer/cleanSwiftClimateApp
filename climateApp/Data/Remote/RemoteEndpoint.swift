import Foundation

extension Remote {
    
    public class Endpoint: NSObject, URLSessionDelegate {
        let baseRequest = Request()
        let garnetRequest = Request()
        let baseRequestV2 = Request()
        
        override init() {
            super.init()
            
            baseRequest.set(session: URLSession(configuration: URLSessionConfiguration.default,
                                                delegate: self,
                                                delegateQueue: nil))
                .set(header: .contentType(.json, nil))
                .set(header: .channel)
            
            garnetRequest.set(session: URLSession(configuration: URLSessionConfiguration.default,
                                                  delegate: self,
                                                  delegateQueue: nil))
                .set(header: .contentType(.json, nil))
                .set(header: .channel)
            
            baseRequestV2.set(session: URLSession(configuration: URLSessionConfiguration.default,
                                                  delegate: self,
                                                  delegateQueue: nil))
                .set(header: .contentType(.json, nil))
                .set(header: .channel)
        }
        
        /*
         disable SSL Authentication for proxy while debugging
         */
        #if DEBUG
        public func urlSession(_ session: URLSession,
                               didReceive challenge: URLAuthenticationChallenge,
                               completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
        ) {
            completionHandler(Foundation.URLSession.AuthChallengeDisposition.useCredential, nil)
        }
        #else
        public func urlSession(_ session: URLSession,
                               didReceive challenge: URLAuthenticationChallenge,
                               completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
        ) {
            completionHandler(Foundation.URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
        }
        #endif
    }
    
}
