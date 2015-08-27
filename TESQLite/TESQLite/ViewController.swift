//
//  ViewController.swift
//  TESQLite
//
//  Created by offcn on 15/8/26.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TETableView: UITableView!
    var statement = COpaquePointer()
    var data: NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TETableView.delegate = self
        TETableView.dataSource = self
        loadData()
    }
    func loadData() {
    
        var path_db = NSBundle.mainBundle().pathForResource("filmoteca", ofType: "sqlite")
        var db = COpaquePointer()
        var status = sqlite3_open(path_db!, &db)
        if status == SQLITE_OK {
        
         //open
        
        }else {
        
           //no open
        }
        var sql_query = "SELECT * FROM pelicula"
        if (sqlite3_prepare_v2(db, sql_query, -1, &statement, nil)) == SQLITE_OK {
            data.removeAllObjects()
            while (sqlite3_step(statement) == SQLITE_OK) {
            
                var dictionary = NSMutableDictionary()
                let director = sqlite3_column_text(statement, 1)
                let buf_director = String.fromCString(UnsafePointer<CChar>(director))
                
                let image = sqlite3_column_text(statement, 2)
                let buf_image = String.fromCString(UnsafePointer<CChar>(image))
                
                let titulo = sqlite3_column_text(statement, 3)
                let buf_titulo = String.fromCString(UnsafePointer<CChar>(titulo))
                
                let year = sqlite3_column_text(statement, 4)
                let buf_year = String.fromCString(UnsafePointer<CChar>(year))
                
                dictionary.setObject(buf_director!, forKey: "director")
                dictionary.setObject(buf_image!, forKey: "image")
                dictionary.setObject(buf_titulo!, forKey: "titulo")
                dictionary.setObject(buf_year!, forKey: "year")
                data.addObject(dictionary)
            
            }
            sqlite3_finalize(statement)
        
        
        
        }else {
          
          println("error")
        }
        
        
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(data)
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("sqlcell") as? TESQLableViewCell
        if cell == nil {
        
           cell = (NSBundle.mainBundle().loadNibNamed("TESQLableViewCell", owner: self, options: nil) as NSArray).lastObject as? TESQLableViewCell
        
        }
        var aux: AnyObject = data[indexPath.row]
        var table_director = aux["director"]
        cell?.nameLabel.text = table_director as? String
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

