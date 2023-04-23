import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var bedenTextField: UITextField!
    @IBOutlet weak var fiyatTextField: UITextField!
    @IBOutlet weak var isimTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //close keyboard.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        view.addGestureRecognizer(imageGestureRecognizer)
    }
    @objc func gorselSec(){
        //kütüphane git-> pickerController
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        //galeri-> göster
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //medya seçimi bitti.
        imageView.image = info[.originalImage] as? UIImage
        //açılan galeriyi kapat.
        self.dismiss(animated: true)
    }
    @objc func klavyeyiKapat(){
        //aksiyonları kapat.
        view.endEditing(true)
    }
    @IBAction func kaydetButtonTiklandi(_ sender: UIButton) {
        //Burada veri çekme yani veri kaydetme yapıyoruz.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "ToDoList", into: context)
        alisveris.setValue(isimTextField.text, forKey: "isim")
        alisveris.setValue(bedenTextField.text, forKey: "beden")
        if let fiyat = Int(fiyatTextField.text!){
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        do{
            try context.save()
        }catch{
            print("error!")
        }
        
    }//Daha sonra çekilen verileri göstereceğiz.
}
