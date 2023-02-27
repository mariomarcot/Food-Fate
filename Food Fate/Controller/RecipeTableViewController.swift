import UIKit

class RecipeTableViewController: UITableViewController {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var type: RecipeType?
    var recipeManager = RecipeManager()
    var recipes: [Recipe] = [] {
        didSet {
            recipeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let type {
            let service = RecipeService()
            service.loadRecipe(type: type) { result in
                switch result {
                case .success(let recipes):
                    self.recipes = recipes
                case .failure(let error):
                    print(error.errorMessage)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.menuCell, for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row].title
        return cell
    }
}
