//
//  Mock.swift
//  HotelDesk
//
//  Created by Александр Катков on 02.10.2022.
//

import Foundation
import UIKit

class Mock {
    
    /// 1 word
    static var word: String {
        return getWords(numberOfWords: 1)
    }
    
    /// 2 - 3 words
    static var smallString: String {
        return getWords(numberOfWords: Int.random(in: 2...3))
    }
    
    /// 3 - 6 words
    static var mediumString: String {
        return getWords(numberOfWords: Int.random(in: 3...6))
    }
    
    /// 6 - 20 words
    static var largeString: String {
        return getWords(numberOfWords: Int.random(in: 6...20))
    }
    
    /// 20 - 60 words
    static var paragraphString: String {
        return getWords(numberOfWords: Int.random(in: 20...60))
    }
    
    /// 1 - 60 words
    static var randomSizeString: String {
        return getWords(numberOfWords: Int.random(in: 1...60))
    }
    
    /// 0 - 100.000.000
    static var integer: Int {
        return Int.random(in: 0...100_000_000)
    }

    static var name: String {
        return UIDevice.current.name
    }
}

extension Mock {
    
    fileprivate static let lorumWords = ["alias", "consequatur", "aut", "perferendis", "sit", "voluptatem", "accusantium", "doloremque", "aperiam",
                                         "eaque", "ipsa", "quae", "ab", "illo", "inventore", "veritatis", "et", "quasi", "architecto", "beatae",
                                         "vitae", "dicta", "sunt", "explicabo", "aspernatur", "aut", "odit", "aut", "fugit", "sed", "quia", "consequuntur",
                                         "magni", "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt", "neque", "dolorem", "ipsum", "quia",
                                         "dolor", "sit", "amet", "consectetur", "adipisci", "velit", "sed", "quia", "non", "numquam", "eius", "modi",
                                         "tempora", "incidunt", "ut", "labore", "et", "dolore", "magnam", "aliquam", "quaerat", "voluptatem", "ut", "enim",
                                         "ad", "minima", "veniam", "quis", "nostrum", "exercitationem", "ullam", "corporis", "nemo", "enim", "ipsam",
                                         "voluptatem", "quia", "voluptas", "sit", "suscipit", "laboriosam", "nisi", "ut", "aliquid", "ex", "ea", "commodi",
                                         "consequatur", "quis", "autem", "vel", "eum", "iure", "reprehenderit", "qui", "in", "ea", "voluptate", "velit",
                                         "esse", "quam", "nihil", "molestiae", "et", "iusto", "odio", "dignissimos", "ducimus", "qui", "blanditiis", "praesentium",
                                         "laudantium", "totam", "rem", "voluptatum", "deleniti", "atque", "corrupti", "quos", "dolores", "et", "quas", "molestias",
                                         "excepturi", "sint", "occaecati", "cupiditate", "non", "provident", "sed", "ut", "perspiciatis", "unde", "omnis", "iste",
                                         "natus", "error", "similique", "sunt", "in", "culpa", "qui", "officia", "deserunt", "mollitia", "animi", "id", "est",
                                         "laborum", "et", "dolorum", "fuga", "et", "harum", "quidem", "rerum", "facilis", "est", "et", "expedita", "distinctio",
                                         "nam", "libero", "tempore", "cum", "soluta", "nobis", "est", "eligendi", "optio", "cumque", "nihil", "impedit", "quo",
                                         "porro", "quisquam", "est", "qui", "minus", "id", "quod", "maxime", "placeat", "facere", "possimus", "omnis", "voluptas",
                                         "assumenda", "est", "omnis", "dolor", "repellendus", "temporibus", "autem", "quibusdam", "et", "aut", "consequatur", "vel",
                                         "illum", "qui", "dolorem", "eum", "fugiat", "quo", "voluptas", "nulla", "pariatur", "at", "vero", "eos", "et", "accusamus",
                                         "officiis", "debitis", "aut", "rerum", "necessitatibus", "saepe", "eveniet", "ut", "et", "voluptates", "repudiandae", "sint",
                                         "et", "molestiae", "non", "recusandae", "itaque", "earum", "rerum", "hic", "tenetur", "a", "sapiente", "delectus", "ut",
                                         "aut", "reiciendis", "voluptatibus", "maiores", "doloribus", "asperiores", "repellat"]
    
    static var mockImage: String? {
        return Bool.random() ? "https://picsum.photos/\(Int.random(in: 200...800))/\(Int.random(in: 200...800))" : nil
    }

    static var restImageLink: String {
        return "https://psv4.userapi.com/c237131/u136202414/docs/d54/9f06d85c8713/firstOderStoryBackground.png?extra=W6p4SMD5L0n9m5FE5_lGS5KJFRjD8YM5tU9Gkz6h_zADYar_pfgeCiKTVYcGL3EDKb_DgWwcjOJyz98FPbrpQf2c0oiPN-2Uuvo0RWYAZoF1AZj1PIKfc9iouu6aSFzBuWBppsQ0GJYkyS0QSyRezr8X"
    }
    
}

// MARK: Support functions

extension Mock {
    
    fileprivate static func getWords(numberOfWords: Int) -> String {
        var words: String = ""
        
        for _ in 0..<numberOfWords {
            var word = lorumWords.randomElement() ?? "-"
            word += " " + word
            
            words += word
        }
        
        return words
    }
}
