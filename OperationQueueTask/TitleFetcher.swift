//
//  TitleFetcher.swift
//  OperationQueueTask
//
//  Created by Dmitry Prisyazhnyuk on 02.12.2021.
//

import Foundation

protocol TitlesFetcher {
    func fetchTitle(with id: Int, completion: @escaping (String) -> Void)
}

class MyFetcher: TitlesFetcher {
    func fetchTitle(with id: Int, completion: @escaping (String) -> Void) {
        let sleepTime = UInt32.random(in: 1...5)
        sleep(sleepTime)
        completion(String(id))
    }
}
