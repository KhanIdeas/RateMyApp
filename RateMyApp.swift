

import UIKit
import StoreKit

public final class RateMyApp  { // lets try
    
    static let `default` = RateMyApp()
    
    private func addRateAskerCounter()
    {
        if UserDefaults.standard.value(forKey: "countOfRateAsks") == nil
        {
            UserDefaults.standard.setValue(1, forKey: "countOfRateAsks")
            UserDefaults.standard.synchronize()
        }
        else
        {
            let count = (UserDefaults.standard.value(forKey: "countOfRateAsks") as! Int) + 1
            UserDefaults.standard.setValue(count, forKey: "countOfRateAsks")
            UserDefaults.standard.synchronize()
            
        }
        
    }
    private func runRateAskerCounter()
    {
        let count = (UserDefaults.standard.value(forKey: "countOfRateAsks") as! Int)
        if (count == 5 || count == 25 || count == 50)
        {
            
            if #available( iOS 10.3,*){
                SKStoreReviewController.requestReview()
            }
        }
        else
        {
            let count = (UserDefaults.standard.value(forKey: "countOfRateAsks") as! Int) - 1
            UserDefaults.standard.setValue(count, forKey: "countOfRateAsks")
            UserDefaults.standard.synchronize()
        }
        
    }
}

