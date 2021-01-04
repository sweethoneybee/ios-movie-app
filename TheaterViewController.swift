import UIKit
import MapKit

class TheaterViewController: UIViewController {
    // 전달되는 데이터를 받을 변수
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        // 1. 위도와 경도를 추출하여 Double 값으로 캐스팅
        let lat = (param["위도"] as! NSString).doubleValue
        let lng = (param["경도"] as! NSString).doubleValue
        // 2. 위도와 경도를 인수로 하는 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        // 3. 지도에 표현될 거리: 값 단위는 m. 이 정수값이 맵에 표시되는 거리(distance), 단위는 m.
        // 맵의 너비를 1미터라고 생각한다면 1:100의 비율이 되므로, 이는 일종의 축척값을 나타낸다. regionRadius 상수에 할당되는
        // 값이 크면 클수록 축첡이 작아지므로 더 넓은 범위가 맵에 표현된다
        let regionRadius: CLLocationDistance = 100
        // 4. 거리를 반영한 지역 정보를 조합한 지도 데이터를 생성
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        // 5. map 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map.setRegion(coordinateRegion, animated: true)
        
        // 위치를 표시해줄 객체를 생성하고, 앞에서 작성해준 위치값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = location
        
        // 위치 표현값을 추가
        self.map.addAnnotation(point)
    }
}
