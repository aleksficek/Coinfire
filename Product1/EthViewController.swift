//
//  EthViewController.swift
//  Product1
//
//  Created by Aleks on 3/22/18.
//  Copyright © 2018 Aleks. All rights reserved.
//


import UIKit
import Charts
import Foundation
import CoreGraphics
import GoogleMobileAds


extension String {
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    func trunc(length: Int, trailing: String = "") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}

class EthViewController: UIViewController,ChartViewDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var coinname: UILabel!
    @IBOutlet weak var cointicker: UILabel!
    @IBOutlet weak var coindate: UILabel!
    
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var floatingLabel: UILabel!
    
    
    @IBOutlet weak var ethprice: UILabel!
    @IBOutlet weak var ethpercent: UILabel!
    @IBOutlet weak var ethvolume: UILabel!
    @IBOutlet weak var ethprevprice: UILabel!
    @IBOutlet weak var ethhighprice: UILabel!
    @IBOutlet weak var ethlowprice: UILabel!
    @IBOutlet weak var ethbuyorder: UILabel!
    @IBOutlet weak var ethsellorder: UILabel!
    
    @IBOutlet weak var chtChart: LineChartView!
    
    @IBOutlet weak var firstdate: UILabel!
    @IBOutlet weak var quardate: UILabel!
    @IBOutlet weak var middate: UILabel!
    @IBOutlet weak var lastdate: UILabel!
    
//    var ethprice_string = String()
    
    @IBAction func yearly(_ sender: Any) {
        
        configureChart(chart: chtChart)
        numbers.removeAll()
        time_array.removeAll()
        time_count = 0
        
        eth_array { (tmp) in
            
            self.firstdate.text = (self.time_array[0]).trunc(length: 10)
            self.quardate.text = (self.time_array[((self.time_count))/3]).trunc(length: 10)
            self.middate.text = (self.time_array[(self.time_count)*2/3]).trunc(length: 10)
            self.lastdate.text = (self.time_array[(self.time_count - 1)]).trunc(length: 10)
        }
    }
    
    @IBAction func monthly(_ sender: Any) {
        
        configureChart(chart: chtChart)
        numbers.removeAll()
        time_array.removeAll()
        time_count = 0
        
        eth_month { (tmp) in
            
            self.firstdate.text = (self.time_array[0]).trunc(length: 10)
            self.quardate.text = (self.time_array[((self.time_count))/3]).trunc(length: 10)
            self.middate.text = (self.time_array[(self.time_count)*2/3]).trunc(length: 10)
            self.lastdate.text = (self.time_array[(self.time_count - 1)]).trunc(length: 10)
        }
    }
    
    @IBAction func daily(_ sender: Any) {
        
        configureChart(chart: chtChart)
        numbers.removeAll()
        time_array.removeAll()
        time_count = 0
        
        eth_day { (tmp) in
            
            self.firstdate.text = (self.time_array[0]).trunc(length: 10)
            self.quardate.text = (self.time_array[((self.time_count))/3]).trunc(length: 10)
            self.middate.text = (self.time_array[(self.time_count)*2/3]).trunc(length: 10)
            self.lastdate.text = (self.time_array[(self.time_count - 1)]).trunc(length: 10)
        }
    }
    
    var numbers : [Double] = [] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    
    var time_array : [String] = [] // Array to store x-axis time values
    var time_count : Int = 0
    

    
    
    func eth_array(completition: @escaping(([String]) -> ()))
    {
        self.chtChart.isUserInteractionEnabled = false
        let url2 = URL(string: Helper.shared.url_year)
        let task2 = URLSession.shared.dataTask(with: url2!) { (data, response, error) in
            if error != nil
            {
                print ("Error!")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        // Array
                        
                        if let myJson = try JSONSerialization.jsonObject(with: content) as? [String:Any] {
                            if let info = myJson["result"] as? [[String:Any]] {
                                //                                print(info)
                                for (index, dict) in info.enumerated() {
                                    //
                                    if index % 4 == 0
                                        {                                    //                                    if index == 187 {
                                        if let price = dict["C"] as? NSNumber {
                                            print(price)
                                            let graphvalue = ("\(price)" as NSString).doubleValue
                                            self.numbers.append(graphvalue) //here we add the data to the array.
                                            
                                        }
                                        
                                        if let time = dict["T"] as? NSString {
                                            print(time)
                                            let graphtime = String("\(time)")
                                            self.time_array.append(graphtime)
                                            self.time_count = self.time_array.count
                                        }
                                        

                                    }
                                    
                                }
                                DispatchQueue.main.async {
                                    completition(self.time_array)
                                }
                                self.updateGraph()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                                    self.chtChart.isUserInteractionEnabled = true
                                }

                            } // else "result" doesn't contain expected array of dictionary
                        } // else content isn't a valid JSON dictionary
                        
                    }
                        
                    catch
                    {
                        
                    }
                }
            }
        }
        task2.resume()
    }
    
    func eth_month(completition: @escaping(([String]) -> ()))
    {
        self.chtChart.isUserInteractionEnabled = false
        let url1 = URL(string: Helper.shared.url_month)
        let task1 = URLSession.shared.dataTask(with: url1!) { (data, response, error) in
            if error != nil
            {
                print ("Error!")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        // Array
                        
                        if let myJson = try JSONSerialization.jsonObject(with: content) as? [String:Any] {
                            if let info = myJson["result"] as? [[String:Any]] {
                                //                                print(info)
                                for (index, dict) in info.enumerated() {
                                    //
                                    if index % 4 == 0
                                        {                                    //                                    if index == 187 {
                                        if let price = dict["C"] as? NSNumber {
                                            print(price)
                                            let graphvalue = ("\(price)" as NSString).doubleValue
                                            self.numbers.append(graphvalue) //here we add the data to the array.
                                           
                                        }
                                        
                                        if let time = dict["T"] as? NSString {
                                            print(time)
                                            let graphtime = String("\(time)")
                                            self.time_array.append(graphtime)
                                            self.time_count = self.time_array.count
                                        }
                                        

                                    }
                                    
                                }
                                DispatchQueue.main.async {
                                    completition(self.time_array)
                                }
                                self.updateGraph()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                                    self.chtChart.isUserInteractionEnabled = true
                                }

                            } // else "result" doesn't contain expected array of dictionary
                        } // else content isn't a valid JSON dictionary
                        
                    }
                        
                    catch
                    {
                        
                    }
                }
            }
        }
        task1.resume()
    }
    
    func eth_day(completition: @escaping(([String]) -> ()))
    {
        self.chtChart.isUserInteractionEnabled = false
        let url = URL(string: Helper.shared.url_week)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("Error!")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        // Array
                        
                        if let myJson = try JSONSerialization.jsonObject(with: content) as? [String:Any] {
                            if let info = myJson["result"] as? [[String:Any]] {
                                //                                print(info)
                                for (index, dict) in info.enumerated() {
                                    //
                                    //                                    if index == 187 {
                                    if index % 4 == 0
                                    {
                                        if let price = dict["C"] as? NSNumber {
                                            print(price)
                                            let graphvalue = ("\(price)" as NSString).doubleValue
                                            self.numbers.append(graphvalue) //here we add the data to the array.
                                            
                                        }
                                        
                                        if let time = dict["T"] as? NSString {
                                            print(time)
                                            let graphtime = String("\(time)")
                                            self.time_array.append(graphtime.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil))
                                            self.time_count = self.time_array.count
                                        }
                                        
                                    }
                                }
                                
                                DispatchQueue.main.async {
                                    completition(self.time_array)
                                }

                                self.updateGraph()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                                     self.chtChart.isUserInteractionEnabled = true
                                }
                               
                            } // else "result" doesn't contain expected array of dictionary
                        } // else content isn't a valid JSON dictionary
                        
                    }
                        
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
 public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
    

         greenNumber.text = "$" + (NSString(format: "%.2f", highlight.y) as String)
         floatingLabel.text = time_array[Int(highlight.x)].replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)
//    floatingLabel.frame.origin = CGPoint(x: highlight.xPx, y: highlight.yPx)
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ethprice.text = ethprice_string
        
//        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
//        addBannerViewToView(bannerView)
//        test ad: ca-app-pub-3940256099942544/2934735716
//        real ad: ca-app-pub-7832694522895754/8448915407
        
        bannerView.adUnitID = "ca-app-pub-7832694522895754/8448915407"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        self.coinname.text = Helper.shared.name
        self.cointicker.text = Helper.shared.ticker
        self.coindate.text = Helper.shared.date
        
        Helper.shared.btc_percent{(tmp) in
            
            //            self.yorn.text = Helper.shared.state
            print(Helper.shared.state)
            
            for (index, dict) in Helper.shared.state.enumerated() {

                let mname = dict["MarketName"] as! NSString
                
                if mname as String == Helper.shared.index_num {
                    if let high = dict["High"] as? NSNumber {
                        DispatchQueue.main.async {
                            self.ethhighprice.text = "$" + String(round(high.doubleValue * 1000.0)/1000.0)
                        }
                    }
                    if let low = dict["Low"] as? NSNumber {
                        DispatchQueue.main.async {
                            self.ethlowprice.text = "$" + String(round(low.doubleValue * 1000.0)/1000.0)
                        }
                    }
                    if let vol = dict["Volume"] as? NSNumber {
                        DispatchQueue.main.async {
                            self.ethvolume.text = String(round(vol.doubleValue * 1000.0)/1000.0)
                        }
                    }
                    if let price = dict["Last"] as? NSNumber {
                        // print(price)
                        DispatchQueue.main.async {
                            self.ethprice.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            // print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.ethpercent.text = "%" + String(prevpercent)
                                self.ethprevprice.text = "$" + String(round(prevprice.doubleValue * 1000.0)/1000.0)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.ethpercent.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.ethpercent.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                        
                        
                    } // else no "Last" or not a String
                    
                    if let buy = dict["OpenBuyOrders"] as? NSNumber {
                        DispatchQueue.main.async {
                            self.ethbuyorder.text = String(buy.doubleValue)
                        }
                    }
                    if let sell = dict["OpenSellOrders"] as? NSNumber {
                        DispatchQueue.main.async {
                            self.ethsellorder.text = String(sell.doubleValue)
                        }
                    }
                    
                }
            }
        }
        // Do any additional setup after loading the view.
        
        configureChart(chart: chtChart)
        
        eth_array { (tmp) in
            
//            let fir = (self.time_array[0])
//            let quar = (self.time_array[((self.time_count))/3])
//            let mid = (self.time_array[(self.time_count)*2/3])
//            let last = (self.time_array[(self.time_count - 1)])
//            let index = fir.index(fir.startIndex, offsetBy: 10)
//            let index2 = quar.index(quar.startIndex, offsetBy: 10)
//            let index3 = mid.index(mid.startIndex, offsetBy: 10)
//            let index4 = last.index(last.startIndex, offsetBy: 10)
//
//            self.firstdate.text = fir.substring(to: index)
//            self.quardate.text = quar.substring(to: index2)
//            self.middate.text = mid.substring(to: index3)
//            self.lastdate.text = last.substring(to: index4)
            
            self.firstdate.text = (self.time_array[0]).trunc(length: 10)
            self.quardate.text = (self.time_array[((self.time_count))/3]).trunc(length: 10)
            self.middate.text = (self.time_array[(self.time_count)*2/3]).trunc(length: 10)
            self.lastdate.text = (self.time_array[(self.time_count - 1)]).trunc(length: 10)
            
        }
        
        chtChart.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureChart(chart : LineChartView)
    {
        chart.chartDescription?.text = ""
        chart.noDataText = "Loading Data"
        chart.backgroundColor = UIColor.clear
        chart.noDataTextColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:1.0)
        chart.noDataFont = UIFont.init(name: "Verdana", size: 10)!
        
        chart.drawGridBackgroundEnabled = false
        chart.dragEnabled = true
        chart.rightAxis.enabled = false
        chart.leftAxis.enabled = true
        chart.doubleTapToZoomEnabled = true
        chart.legend.enabled = false
        chart.pinchZoomEnabled = false
        chart.highlightPerTapEnabled = true
        chart.highlightPerDragEnabled = true
        chart.rightAxis.drawLabelsEnabled = true
        chart.rightAxis.drawAxisLineEnabled = true
        
        chart.xAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.labelTextColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:1.0)
        
        chart.xAxis.centerAxisLabelsEnabled = true
        chart.xAxis.granularityEnabled = true
        chart.xAxis.drawAxisLineEnabled = true
        chart.xAxis.labelTextColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:1.0)
        
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.drawGridLinesEnabled = true
        chart.leftAxis.labelCount = 6
        chart.leftAxis.forceLabelsEnabled = false
        chart.leftAxis.labelTextColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:1.0)
        
        chart.drawBordersEnabled = false
        chart.borderColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:1.0)
        chart.gridBackgroundColor = UIColor.init(red:0.47, green:0.47, blue:0.47, alpha:0.8)
        
        chart.leftAxis.yOffset = -8
        
        chart.animate(yAxisDuration: 1.6)
        
//        xAxis.labelFont = UIFont(name: Constants.Fonts.ProximaNovaBold, size: 15.0)!
        
        chart.leftAxis.labelFont = UIFont.init(name: "Verdana", size: 10)!
        
        chart.leftAxis.labelPosition = .insideChart
        
        
//        chart.rightAxis.axisMinimum = 10.0
//        chart.leftAxis.axisMinimum = -100.0
        
//        self.chartView.xAxis.drawGridLinesEnabled = false
//        self.chartView.leftAxis.drawLabelsEnabled = false
//        self.chartView.legend.enabled = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        
        //here is the for loop
        for i in 0..<numbers.count {
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [UIColor.init(red:0.22, green:0.66, blue:0.67, alpha:1.0)] //Sets the colour to blue
        //        chtChart.backgroundColor = UIColor(red:120/255, green:236/255,blue:236/255,alpha:1)
        //        chtChart.xAxis.gridColor = UIColor(red:220/255, green:220/255,blue:220/255,alpha:1)
        line1.drawCirclesEnabled = false
        line1.drawValuesEnabled = false
        
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        
        
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
        chtChart.chartDescription?.text = "" // Here we set the description for the graph
//        chtChart.legend.enabled = false
//        chtChart.xAxis.drawGridLinesEnabled = false
        
        line1.fillAlpha = 1.0
        //        let gradientColors = [UIColor.init(red:0.00, green:1.00, blue:1.00, alpha:1.0).cgColor, UIColor.clear.cgColor] as CFArray // Colors of the gradient
        //        let colorLocations:[CGFloat] = [1.0, 0.0] // Positioning of the gradient
        //        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        //        line1.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        line1.drawFilledEnabled = true // Draw the Gradient
        line1.fillColor = UIColor.init(red:0.22, green:0.66, blue:0.67, alpha:1.0)
        
        
        chtChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:time_array)
        chtChart.xAxis.granularity = 1
    }

}
