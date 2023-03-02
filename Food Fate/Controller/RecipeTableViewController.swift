import UIKit

class RecipeTableViewController: UITableViewController {
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    var type: String?
    var recipeTableViewCell = RecipeTableViewCell()
    var recipes: [Recipe] = [] {
        didSet {
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.identifier)

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell else { return
            UITableViewCell()
        }
        let recipes = recipes[indexPath.row]
        cell.update(recipes)
        return cell
    }
}
