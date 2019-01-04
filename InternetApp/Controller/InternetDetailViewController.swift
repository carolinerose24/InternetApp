//
//  InternetDetailViewController.swift
//  InternetApp
//
//  Created by Jarman, Caroline on 12/17/18.
//  Copyright © 2018 ctec. All rights reserved.
//

import UIKit
import WebKit

public class InternetDetailViewController: UIViewController
{
    //did set happens once-> waits for others to get set 

    
    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    
    var detailTitle: String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress: String?
    {
        didSet
        {
            updateView()
        }
    }
    
    private func updateView() -> Void
    {
        if (detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if (detailTitle?.range(of: "Definitions",  options: .caseInsensitive) != nil)
            {
                loadPDF()
            }
            else
            {
                if (detailAddress != nil)
                {
                    loadURL (webAdress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    
    
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateView()

        // Do any additional setup after loading the view.
    }
    
    private func loadURL(webAdress: String ) -> Void
    {
        let currentURL = URL(string: webAdress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource:"Internet Terms", withExtension: "pdf", subdirectory:nil, localization: nil)
        {                                                   //means Internet Terms.pdf  localization->load for a specific language
            let requestedPDF = NSURLRequest(url:contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
