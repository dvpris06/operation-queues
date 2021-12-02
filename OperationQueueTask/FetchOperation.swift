//
//  FetchOperation.swift
//  OperationQueueTask
//
//  Created by Dmitry Prisyazhnyuk on 02.12.2021.
//

import Foundation

class FetchOperation: AsyncOperation {
    let id: Int
    let fetcher: TitlesFetcher
    var title: String?
    
    init(id: Int, fetcher: TitlesFetcher) {
        self.id = id
        self.fetcher = fetcher
        super.init()
    }
    
    override func main() {
        fetcher.fetchTitle(with: id) { [weak self] title in
            self?.title = title
            self?.state = .finished
        }
    }
}
