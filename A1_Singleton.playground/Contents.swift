
////////////////////////////////////////////////////////////////////////////////
// Singleton

class DataCenter {
  static let sharedInstance = DataCenter()
  
  //This prevents others from using the default '()' initializer for this class.
  private init() {}
}

let dateCenter = DataCenter.sharedInstance
