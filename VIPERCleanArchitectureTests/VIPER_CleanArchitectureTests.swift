//
//  VIPER_CleanArchitectureTests.swift
//  VIPER-CleanArchitectureTests
//
//  Created by danny santoso on 22/02/21.
//

import XCTest
import RxSwift
import RxTest
@testable import VIPERCleanArchitecture

class VIPER_CleanArchitectureTests: XCTestCase {
    
    var homeInteractor: HomeInteractor!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        homeInteractor = HomeInteractor(repository: Repository(remoteDataSources: RemoteDataSources(), localeDataSources: LocaleDataSources()))
    }
    
    func testEventGetGames() {
        let scheduler = TestScheduler(initialClock: 0)
        let observer = scheduler.createObserver([GameDomain].self)
        let testObservable = homeInteractor.getGames()
        
        testObservable.subscribe(observer).disposed(by: disposeBag)
        scheduler.start()

//        let expectedEvents = [
//            Recorded.next(2, true),
//            Recorded.completed(10)
//        ]
        
        XCTAssertNotNil(observer.events[0].value)
        XCTAssertNotNil(observer.events[1].value)
        XCTAssertEqual(observer.events.count, 2)
        XCTAssertFalse(observer.events.isEmpty)
    }
}
