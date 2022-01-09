import Foundation

struct Remote {
    enum Error: LocalizedError {
        case nilResponse
        case noContent
        case decode(data: Data, underlyingError: Swift.Error)
        case service(exception: [ServiceException])
        case response(code: Int)

        public var errorDescription: String? {
            switch self {
            case .decode(_, let underlyingError):
                return underlyingError.localizedDescription
            case .service(let exception):
                return exception.first?.message
            case .response, .nilResponse, .noContent:
                return NSLocalizedString("İçerik alınamadı", comment: "Nil response received")
            }
        }
    }
}
