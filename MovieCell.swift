import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel! // 영화 제목
    @IBOutlet var desc: UILabel! // 영화에 대한 내용 설명
    @IBOutlet var opendate: UILabel! // 개봉일
    @IBOutlet var rating: UILabel! // 평점
    @IBOutlet var thumbnail: UIImageView! // 섬네일 이미지
}
