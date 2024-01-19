//
//  DocumentTableViewController.swift
//  Document_App
//
//  Created by Anis KHIARI on 1/16/24.
//

import UIKit
import QuickLook

class DocumentTableViewController: UITableViewController, UIDocumentPickerDelegate, UISearchBarDelegate {
    var documentList = [DocumentFile]()
    var bundledDocuments = [DocumentFile]()
    var userAddedDocuments = [DocumentFile]()
    let searchBar = UISearchBar()
    enum Section: Int {
        case Import
        case Bundle
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bundledDocuments = listFileInBundle()
        userAddedDocuments = getFileToDocumentDirectory()
        documentList = bundledDocuments + userAddedDocuments;      
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openDocumentPicker))
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    // Indique au Controller combien de sections il doit afficher
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return 0
    //    }
    //
    //    // Indique au Controller combien de cellules il doit afficher
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 0
    //    }
    // Indique au Controller comment remplir la cellule avec les données
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        return
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
    func getFileToDocumentDirectory() -> [DocumentFile] {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }

        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)

            return fileURLs.compactMap { url in
                let fileSize = (try? url.resourceValues(forKeys: [.fileSizeKey]))?.fileSize
                return DocumentFile(title: url.lastPathComponent, size: fileSize ?? 0, imageName: url.lastPathComponent, url: url, type: url.pathExtension)
            }
        } catch {
            print("Erreur lors de la lecture du répertoire des documents: \(error)")
            return []
        }
    }
    
    func copyFileToDocumentsDirectory(fromUrl url: URL) {
          // On récupère le dossier de l'application, dossier où nous avons le droit d'écrire nos fichiers
          let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
          
          // Nous créons une URL de destination pour le fichier
          let destinationUrl = documentsDirectory.appendingPathComponent(url.lastPathComponent)
          
          do {
              
              // Puis nous copions le fichier depuis l'URL source vers l'URL de destination
              try FileManager.default.copyItem(at: url, to: destinationUrl)
          } catch {
              print(error)
          }
      }
    
    @objc func openDocumentPicker() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.jpeg, .png, .text,.pdf,.commaSeparatedText])
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .overFullScreen

        present(documentPicker, animated: true)
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        
        // Assurez-vous que l'URL est accessible
        guard url.startAccessingSecurityScopedResource() else { return }

        let resourcesValues = try! url.resourceValues(forKeys: [.contentTypeKey, .nameKey, .fileSizeKey])// Obtient les valeurs des propriétés du fichier
           
        // Vous pouvez maintenant utiliser l'URL pour accéder au fichier
        // Par exemple, ajouter le fichier à votre liste de documents
        let newDocument = DocumentFile(title: url.lastPathComponent, size: resourcesValues.fileSize ?? 0, url: url, type: resourcesValues.contentType!.description)
   

        copyFileToDocumentsDirectory(fromUrl: url)
        userAddedDocuments.append(newDocument)
        documentList.append(newDocument)
        //= getFileToDocumentDirectory() + listFileInBundle()
        tableView.reloadData()

        
        url.stopAccessingSecurityScopedResource()
    }


    // Indique au Controller combien de sections il doit afficher
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    // Indique au Controller combien de cellules il doit afficher
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userAddedDocuments = getFileToDocumentDirectory()
        switch Section(rawValue: section) {
        case .Import:
            return userAddedDocuments.count
        case .Bundle:
            return bundledDocuments.count
        default:
            return 0
        }
    }
    
    // Indique au Controller comment remplir la cellule avec les données
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        userAddedDocuments = getFileToDocumentDirectory()
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)

        let document: DocumentFile
        switch Section(rawValue: indexPath.section) {
        case .Import:
            document = userAddedDocuments[indexPath.row]
        case .Bundle:
            document = bundledDocuments[indexPath.row]
        default:
            fatalError("Section non reconnue")
        }

        cell.textLabel?.text = document.title
        cell.detailTextLabel?.text = "\(document.size) "

        return cell
    }
    
    // On utilise plus un segue, nous devons donc utiliser le navigationController pour afficher le QLPreviewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userAddedDocuments = getFileToDocumentDirectory()
        let document: DocumentFile
        switch Section(rawValue: indexPath.section) {
        case .Import:
            document = userAddedDocuments[indexPath.row]
        case .Bundle:
            document = bundledDocuments[indexPath.row]
        default:
            fatalError("Section non reconnue")
        }

        self.instantiateQLPreviewController(withUrl: document.url)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section) {
        case .Import:
            return "Importés"
        case .Bundle:
            return "Bundle"
        default:
            return nil
        }
    }


    // Todo
    func instantiateQLPreviewController(withUrl url: URL){
        let previewController = QLPreviewController()
        previewController.dataSource = self

        let totalBundledDocuments = bundledDocuments.count
        if let index = bundledDocuments.firstIndex(where: { $0.url == url }) {
            previewController.currentPreviewItemIndex = index
        } else if let index = userAddedDocuments.firstIndex(where: { $0.url == url }) {
            previewController.currentPreviewItemIndex = index + totalBundledDocuments
        }

        present(previewController, animated: true)
    }

    
    func listFileInBundle() -> [DocumentFile] {
            
            let fm = FileManager.default // crée une instance de FileManager
            let path = Bundle.main.resourcePath! // Obtient le chemin du répertoire
            let items = try! fm.contentsOfDirectory(atPath: path)// Obtient la liste des fichiers dans le répertoire
            
            var documentListBundle = [DocumentFile]() // Initialise un tableau vide pour stocker les fichiers
        
            for item in items {
                if !item.hasSuffix("DS_Store"){ // Vérifie que le fichier n'est pas un fichier .DS_Store et qu'il a l'extension .jpg
                    let currentUrl = URL(fileURLWithPath: path + "/" + item) // Crée une URL à partir du chemin du fichier
                    let resourcesValues = try! currentUrl.resourceValues(forKeys: [.contentTypeKey, .nameKey, .fileSizeKey])// Obtient les valeurs des propriétés du fichier
                       
                    documentListBundle.append(DocumentFile(
                        title: resourcesValues.name!,// Récupère le nom du fichier
                        size: resourcesValues.fileSize ?? 0, // Récupère la taille du fichier ou utilise 0 par défaut
                        imageName: item, // Stocke le nom du fichier
                        url: currentUrl, // Stocke l'URL du fichier
                        type: resourcesValues.contentType!.description)// Récupère le type de contenu du fichier
                    )
                }
            }
            return documentListBundle  // Retourne la liste des fichiers
        }
    
    struct DocumentFile {
        var title: String;
        var size: Int;
        var imageName: String? = nil;
        var url: URL;
        var type: String;
        
        static var documentList =        [
            DocumentFile(title: "Document 1", size: 100, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 2", size: 200, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 3", size: 300, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 4", size: 400, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 5", size: 500, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 6", size: 600, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 7", size: 700, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 8", size: 800, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 9", size: 900, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
            DocumentFile(title: "Document 10", size: 1000, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain")
        ]
    }
}



extension Int {
    func formattedSize() -> String {
        let byteCountFormatter = ByteCountFormatter()
        return byteCountFormatter.string(fromByteCount: Int64(self))
    }
}

extension DocumentTableViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int{
        return bundledDocuments.count + userAddedDocuments.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let totalBundledDocuments = bundledDocuments.count
        let document = index < totalBundledDocuments ? bundledDocuments[index] : userAddedDocuments[index - totalBundledDocuments]
        return document.url as QLPreviewItem
        
    }
    
}


