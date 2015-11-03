
import UIKit


class SignUpViewController: UIViewController{
    
    @IBOutlet var emailf: UITextField!
    @IBOutlet var passwordf: UITextField!
    @IBOutlet var phonef: UITextField!
//    @IBOutlet var Picker: UIPickerView!
//    @IBOutlet var usertypeLabel: UILabel!
    
//    var usertype_array = ["patient","nurse"]

    
//    @IBAction func BackButton(sender: AnyObject) {
//        navigationController!.presentingViewController!.dismissViewControllerAnimated(true, completion: {});
//    }
    @IBAction func submit(sender: AnyObject) {
        let email = emailf.text
        let password = passwordf.text
        let phone = phonef.text
        
        //check for empty fields
        if(email?.isEmpty == true || password?.isEmpty == true
            || phone?.isEmpty == true){
                displayAlert("All fields must be entered!")
                return;
        }
        
        //check is passwords match
        
        //store data
//        let usertype = usertypeLabel.text
        writeFile(email!, newpassword: password!, newphone: phone!)
        
        //display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. Thank you", preferredStyle: UIAlertControllerStyle.Alert)
        let Notification = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(Notification)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    


    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
//        Picker.dataSource = self
//        Picker.delegate = self
//        usertypeLabel.text = usertype_array[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
//        return 1
//    }
//    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//        return usertype_array.count
//    }
//    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
//        return usertype_array[row]
//    }
//    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
//        let rowselected = usertype_array[row]
//        usertypeLabel.text = rowselected
//    }
    
    func displayAlert(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let Notification = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(Notification)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func writeFile(newemail: String, newpassword: String, newphone: String) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        let documentsDirectory = paths.stringByAppendingString("/UserInfo.txt")
        let text = newemail + " , " + newpassword + " , " + newphone + "\n"
        if let outputStream = NSOutputStream(toFileAtPath: documentsDirectory, append: true) {
            outputStream.open()
            outputStream.write(text)
            outputStream.close()
        }
    }
}



extension NSOutputStream {
    // Write String to outputStream
    func write(string: String, encoding: NSStringEncoding = NSUTF8StringEncoding, allowLossyConversion: Bool = true) -> Int {
        if let data = string.dataUsingEncoding(encoding, allowLossyConversion: allowLossyConversion) {
            var bytes = UnsafePointer<UInt8>(data.bytes)
            var bytesRemaining = data.length
            var totalBytesWritten = 0
            
            while bytesRemaining > 0 {
                let bytesWritten = self.write(bytes, maxLength: bytesRemaining)
                if bytesWritten < 0 {
                    return -1
                }
                bytesRemaining -= bytesWritten
                bytes += bytesWritten
                totalBytesWritten += bytesWritten
            }
            
            return totalBytesWritten
        }
        
        return -1
    }
    
}