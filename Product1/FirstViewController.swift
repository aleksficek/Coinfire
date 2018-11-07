//
//  FirstViewController.swift
//  Product1
//
//  Created by Aleks on 1/26/18.
//  Copyright © 2018 Aleks. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


class Helper {
    static let shared = Helper()
    private init(){}
    var state = [[String:Any]]()
    
    var name = String()
    var ticker = String()
    var date = String()
    var url_year = String()
    var url_month = String()
    var url_week = String()
    
    var index_num = String()
    
    func btc_percent(completition: @escaping(([[String:Any]]) -> ()))
    {
        let url2 = URL(string: "https://bittrex.com/api/v1.1/public/getmarketsummaries")
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
                                // print(info)
                                self.state = info
                                DispatchQueue.main.async {
                                    completition(self.state)
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
}


class FirstViewController: UIViewController {

    @IBOutlet weak var bitcoinlabel: UILabel!
    @IBOutlet weak var bitcoin24h: UILabel!
    @IBAction func bitcoinbutton(_ sender: Any)
    {
        Helper.shared.name = "BITCOIN"
        Helper.shared.ticker = "TICKER: BTC"
        Helper.shared.date = "CREATED: JAN 2009"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BTC&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BTC&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BTC&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-BTC"
        
    }
    
    @IBOutlet weak var labeleth: UILabel!
    @IBOutlet weak var eth24h: UILabel!
    @IBAction func ethbutton(_ sender: Any)
    {
//        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "ETHEREUM"
        Helper.shared.ticker = "TICKER: ETH"
        Helper.shared.date = "CREATED: JULY 2015"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETH&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETH&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETH&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-ETH"
    }
    
    @IBOutlet weak var labelxrp: UILabel!
    @IBOutlet weak var xrp24h: UILabel!
    @IBAction func buttonxrp(_ sender: Any)
    {
        //        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "RIPPLE"
        Helper.shared.ticker = "TICKER: XRP"
        Helper.shared.date = "CREATED: SEPT 2012"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-XRP"
    }
    
    @IBOutlet weak var labeltrx: UILabel!
    @IBOutlet weak var trx24h: UILabel!
    @IBAction func buttontrx2(_ sender: Any)
    {
        //        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "TRON"
        Helper.shared.ticker = "TICKER: TRX"
        Helper.shared.date = "CREATED: SEPT 2017"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-TRX"
    }
    
    @IBOutlet weak var labelxmr: UILabel!
    @IBOutlet weak var xmr24h: UILabel!
    @IBAction func buttonxmr2(_ sender: Any)
    {
        //        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "MONERO"
        Helper.shared.ticker = "TICKER: XMR"
        Helper.shared.date = "CREATED: APRIL 2014"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-XMR"
    }
    
    @IBOutlet weak var labelxem: UILabel!
    @IBOutlet weak var xem24h: UILabel!
    @IBAction func buttonomg2(_ sender: Any)
    {
        //        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "OMISEGO"
        Helper.shared.ticker = "TICKER: OMG"
        Helper.shared.date = "CREATED: JUNE 2017"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-OMG"
    }
    
    @IBOutlet weak var labelxlm: UILabel!
    @IBOutlet weak var xlm24h: UILabel!
    @IBAction func buttonxvg2(_ sender: Any)
    {
        //        performSegue(withIdentifier: "segue_eth", sender: self)
        Helper.shared.name = "VERGE"
        Helper.shared.ticker = "TICKER: XVG"
        Helper.shared.date = "CREATED: AUG 2014"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XVG&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XVG&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XVG&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-XVG"
    }
    
//    @IBAction func xrpbutton(_ sender: Any)
//    {
//        Helper.shared.name = "RIPPLE"
//        Helper.shared.ticker = "TICKER: XRP"
//        Helper.shared.date = "CREATED: SEPT 2012"
//        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=day"
//        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=hour"
//        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XRP&tickInterval=thirtyMin"
//        Helper.shared.index_num = 281
//    }
    
    @IBOutlet weak var labelbch: UILabel!
    @IBOutlet weak var bch24h: UILabel!
    @IBAction func bchbuton(_ sender: Any)
    {
        Helper.shared.name = "BITCOIN CASH"
        Helper.shared.ticker = "TICKER: BCH"
        Helper.shared.date = "CREATED: JAN 2009"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BCH&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BCH&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-BCH&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-BCH"
    }
    
    @IBOutlet weak var labelada: UILabel!
    @IBOutlet weak var ada24h: UILabel!
    @IBAction func adabutton(_ sender: Any)
    {
        Helper.shared.name = "CARDANO"
        Helper.shared.ticker = "TICKER: ADA"
        Helper.shared.date = "CREATED: AUG 2017"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ADA&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ADA&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ADA&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-ADA"
    }
    

//    @IBAction func trxbutton(_ sender: Any)
//    {
//        Helper.shared.name = "TRON"
//        Helper.shared.ticker = "TICKER: TRX"
//        Helper.shared.date = "CREATED: SEPT 2017"
//        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=day"
//        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=hour"
//        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-TRX&tickInterval=thirtyMin"
//        Helper.shared.index_num = 278
//    }
    
    @IBOutlet weak var labelltc: UILabel!
    @IBOutlet weak var ltc24h: UILabel!
    @IBAction func ltcbutton(_ sender: Any)
    {
        Helper.shared.name = "LITECOIN"
        Helper.shared.ticker = "TICKER: LTC"
        Helper.shared.date = "CREATED: OCT 2011"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-LTC&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-LTC&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-LTC&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-LTC"
    }
    
    @IBOutlet weak var labelneo: UILabel!
    @IBOutlet weak var neo24h: UILabel!
    @IBAction func neobutton(_ sender: Any)
    {
        Helper.shared.name = "NEO"
        Helper.shared.ticker = "TICKER: NEO"
        Helper.shared.date = "CREATED: FEB 2014"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-NEO&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-NEO&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-NEO&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-NEO"
    }
    
    @IBOutlet weak var labeldash: UILabel!
    @IBOutlet weak var dash24h: UILabel!
    @IBAction func dashbutton(_ sender: Any)
    {
        Helper.shared.name = "DASH"
        Helper.shared.ticker = "TICKER: DASH"
        Helper.shared.date = "CREATED: JAN 2014"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-DASH&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-DASH&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-DASH&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-DASH"
    }
    

//    @IBAction func xmrbutton(_ sender: Any)
//    {
//        Helper.shared.name = "MONERO"
//        Helper.shared.ticker = "TICKER: XMR"
//        Helper.shared.date = "CREATED: APRIL 2014"
//        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=day"
//        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=hour"
//        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-XMR&tickInterval=thirtyMin"
//        Helper.shared.index_num = 280
//    }

//    @IBAction func xembutton(_ sender: Any)
//    {
//        Helper.shared.name = "OMISEGO"
//        Helper.shared.ticker = "TICKER: OMG"
//        Helper.shared.date = "CREATED: JUNE 2017"
//        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=day"
//        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=hour"
//        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-OMG&tickInterval=thirtyMin"
//        Helper.shared.index_num = 276
//    }
    
    @IBOutlet weak var labeletc: UILabel!
    @IBOutlet weak var etc24h: UILabel!
    @IBAction func etcbutton(_ sender: Any)
    {
        Helper.shared.name = "ETHEREUM CLASSIC"
        Helper.shared.ticker = "TICKER: ETC"
        Helper.shared.date = "CREATED: JULY 2015"
        Helper.shared.url_year = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETC&tickInterval=day"
        Helper.shared.url_month = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETC&tickInterval=hour"
        Helper.shared.url_week = "https://bittrex.com/Api/v2.0/pub/market/GetTicks?marketName=USDT-ETC&tickInterval=thirtyMin"
        Helper.shared.index_num = "USDT-ETC"
    }
      
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Helper.shared.btc_percent{(tmp) in
            
            //            self.yorn.text = Helper.shared.state
            print(Helper.shared.state)
            
            for (index, dict) in Helper.shared.state.enumerated() {

                let mname = dict["MarketName"] as! NSString
            
                if mname == "USDT-ADA" {
                    if let price = dict["Last"] as? NSNumber {
                        // print(price)
                        DispatchQueue.main.async {
                            self.labelada.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            // print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.ada24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.ada24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.ada24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                        
                        
                    } // else no "Last" or not a String
                    
                }
                
                if mname == "USDT-BCH" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelbch.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.bch24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.bch24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.bch24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }
                
                if mname == "USDT-BTC" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.bitcoinlabel.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.bitcoin24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.bitcoin24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.bitcoin24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }
                
                if mname == "USDT-DASH" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labeldash.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.dash24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.dash24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.dash24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

               if mname == "USDT-ETC" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labeletc.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.etc24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.etc24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.etc24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-ETH" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labeleth.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.eth24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.eth24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.eth24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-LTC" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelltc.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.ltc24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.ltc24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.ltc24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-NEO" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelneo.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.neo24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.neo24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.neo24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }
                
                if mname == "USDT-OMG" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelxem.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.xem24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.xem24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.xem24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-TRX" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labeltrx.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.trx24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.trx24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.trx24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-XMR" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelxmr.text = "$" + String(round(price.doubleValue * 100.0)/100.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.xmr24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.xmr24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.xmr24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }

                if mname == "USDT-XRP" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelxrp.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.xrp24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.xrp24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.xrp24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                }
                
                if mname == "USDT-XVG" {
                    if let price = dict["Last"] as? NSNumber {
                        print(price)
                        DispatchQueue.main.async {
                            self.labelxlm.text = "$" + String(round(price.doubleValue * 1000.0)/1000.0)
                        }
                        if let prevprice = dict["PrevDay"] as? NSNumber {
                            print(prevprice)
                            let prevpercent = (round((price.doubleValue - prevprice.doubleValue)/prevprice.doubleValue * 10000.0) / 100.0)
                            DispatchQueue.main.async {
                                self.xlm24h.text = "%" + String(prevpercent)
                            }
                            if (prevpercent > 0) {
                                DispatchQueue.main.async {
                                    self.xlm24h.textColor = UIColor(rgb: 0x2eb82e)
                                }
                            }
                            if (prevpercent < 0) {
                                DispatchQueue.main.async {
                                    self.xlm24h.textColor = UIColor(rgb: 0xff3333)
                                }
                            }
                        }
                    } // else no "Last" or not a String
                    }
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




