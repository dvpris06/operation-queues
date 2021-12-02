//
//  MyClass.swift
//  OperationQueueTask
//
//  Created by Dmitry Prisyazhnyuk on 02.12.2021.
//

import Foundation

class MyClass {
    let titlesFetcher: TitlesFetcher
    
    init(fetcher: TitlesFetcher) {
        self.titlesFetcher = fetcher
    }
    
    func downloadTitles(with ids: [Int], completion: @escaping ([String]) -> Void) {
        let fetchingQueue = OperationQueue()
        var titles = Array.init(repeating: "", count: ids.count)
        
        let resultQueue = OperationQueue()
        resultQueue.maxConcurrentOperationCount = 1
        
        for (index, id) in ids.enumerated() {
            let fetchOp = FetchOperation(id: id, fetcher: titlesFetcher)
            fetchOp.completionBlock = {
                guard let title = fetchOp.title else { return }
                resultQueue.addOperation {
                    titles[index] = title
                }
            }
            fetchingQueue.addOperation(fetchOp)
        }
        
        // Сомневаюсь, что адекватное решение, но отрабатывает всегда правильно
        
        fetchingQueue.addBarrierBlock {
            resultQueue.addBarrierBlock {
                completion(titles)
            }
        }
    }
}
