//
//  TableViewController.swift
//  aled
//
//  Created by Morgann Riu on 07/11/2019.
//  Copyright © 2019 Morgann Riu. All rights reserved.
//!

import UIKit

class TableViewController: UITableViewController {
    
    var baseDeDonnées: [NSArray] = [] 

    
    override func viewWillAppear(_ animated: Bool) {
    
        let url = URL(string: "https://boardfabientestimerir.herokuapp.com/boards")

                         //create the session object
                         let session = URLSession.shared

                         //now create the URLRequest object using the url object
                                var request = URLRequest(url: url!)
                         request.httpMethod = "GET" //set http method as GET
                     //create dataTask using the session object to send data to the server
                         let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                             guard error == nil else {
                                 return
                             }

                             guard let data = data else {
                                 return
                             }

                             do {
                               //  print(data)
                                 print(try! JSONSerialization.jsonObject(with: data, options: .mutableContainers))
                                //            {
                                //                erreur = 0;
                                //                login = salut;
                                //                mail = "salut@salut.fr";
                                //            }
                                 //create json object from data
                                 if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any ] {
                               
                                  
                                    
                                        DispatchQueue.main.async {
                                           
                                            
                                           // les label
                                          //  print(  json["boards"]! )
                                       
                                            
                                            
                                            
                                                 DispatchQueue.main.async {
                                                 

                                                                     self.tableView.reloadData()
                                                                     }
                                     

                                            
                                     // handle json...
                                    }
                                }
                             } catch let error {
                                 print(error.localizedDescription)
                                // erreur ?

                             }
                            
                           
                         })
                         task.resume()
            
            
            
            
          }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseDeDonnées.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)

        // Configure the cell...
       // cell.textLabel?.text = baseDeDonnées[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            
            let row = tableView.indexPathForSelectedRow!.row
       //     destination.initialText = baseDeDonnées[row]
        }
    }

    
    
 
    

}
