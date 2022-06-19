import Foundation

/*
 기본점수 - 검색어 등장 횟수 (대소문자 무시)
 외부링크 수 - 외부 링크 개수
 링크점수 - (링크가 걸린 다른 페이지의 기본점수 / 외부링크 수) 의 총합
 매칭점수 - 기본점수 + 링크점수
 */

struct Page {
    var index: Int
    var url: String
    var score: Double
    var externalLinks: [String]
}

func solution(_ word: String, _ pages: [String]) -> Int {
    var pageInfos: [Page] = []

    for (i, page) in pages.enumerated() {
        var pageInfo = Page(index: i, url: "", score: 0, externalLinks: [])
        var score = 0
        var isBody = false

        let tags = page.split(separator: "<")

        for t in tags {
            let tag = String(t)
            
            // 페이지 링크
            if tag.prefix(6) == "meta p" {
                let separated = tag.split(separator: " ").last!
                let url = separated.split(separator: "\"")[1]
                pageInfo.url = String(url)
            }
            // 외부 링크
            else if tag.prefix(6) == "a href" {
                let url = tag.split(separator: "\"")[1]
                pageInfo.externalLinks.append(String(url))
            }
            // body 내부 표시
            else if tag.prefix(4) == "body" {
                isBody = true
            }
            // 단어 개수 삽입
            else if tag.prefix(5) == "/body" {
                pageInfo.score += Double(score)
                break
            }
            // 단어 찾기
            if isBody {
              score += findWordInBody(tag: tag, word: word.lowercased())
            }
        }
        pageInfos.append(pageInfo)
    }

    for pageInfo in pageInfos {
        for link in pageInfo.externalLinks {
            if let index = pageInfos.firstIndex(where: { $0.url == link }) {
                let linkScore = pageInfo.score / Double(pageInfo.externalLinks.count)
                pageInfos[index].score += linkScore
            }
        }
    }

    let answer = pageInfos.sorted { $0.score > $1.score }.first?.index ?? 0

    return answer
}

func findWordInBody(tag: String, word: String) -> Int {
   var score = 0
   let contains = tag.split(separator: " ").filter { $0.lowercased().contains(word) }

   for contain in contains {
       let new = contain.map { $0.isLetter ? String($0.lowercased()) : " " }.joined().split(separator: " ")
       score += new.filter { $0 == word }.count
   }

   return score
}
