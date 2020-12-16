//
//  ViewController.swift
//  ChartsPractice
//
//  Created by 윤병일 on 2020/12/16.
//

import UIKit
import Charts

class ViewController: UIViewController {

  //MARK: - Properties
  private let backgroundView : UIView = {
    let v = UIView()
    return v
  }()
  
  private let barChartView  : BarChartView = {
    let v = BarChartView()
    return v
  }()
  
  var months : [String]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
     configureUI()
      months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
      let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            
      setChart(dataPoints: months, values: unitsSold)
  }

  //MARK: - configureUI()
  private func configureUI() {
    [backgroundView, barChartView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      barChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      barChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      barChartView.widthAnchor.constraint(equalToConstant: 300),
      barChartView.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
  
  func setChart(dataPoints: [String], values: [Double]) {
//      barChartView.noDataText = "You need to provide data for the chart."
    var dataEntries: [BarChartDataEntry] = []
            
    // for 문을 dataPoints 카운트 만큼 돌려서
    for i in 0..<dataPoints.count {
      let dataEntry = BarChartDataEntry( x: Double(i), y: values[i])
        dataEntries.append(dataEntry)
    }
            
    // 차트 데이터 셋트에 넣어주고
    let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Units Sold")
    // 차트 색 여러가지 나타내기
    chartDataSet.colors = ChartColorTemplates.colorful()
    // 그걸 다시 차트 데이터에 넣어주고
    let chartData = BarChartData(dataSet: chartDataSet)
    // 뷰에 데이터를 넣어준다.
    barChartView.data = chartData
    barChartView.xAxis.labelPosition = .bottom
    barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
    // 차트뷰의 backgroundColor 설정
    barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
    // 차트뷰 애니메이션. eadingOption 은 여러가지가 있다.
    barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
          
  }

}

