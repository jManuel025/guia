import 'package:rxdart/rxdart.dart';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:guiaestudiante/src/providers/recipe_provider.dart';

class RecipesBloc {
  final _recipesController = new BehaviorSubject<List<RecipeModel>>();
  final _loadingController = new BehaviorSubject<bool>();

  final _recipesProvider = new RecipesProvider();

  Stream<List<RecipeModel>> get recipesStream => _recipesController.stream;
  // Stream<bool> get loading => _loadingController.stream;

  // void loadingRecipes() async {
  //   final recipes = await _recipesProvider.loadRecipes();
  //   _recipesProvider.sink.add(recipes);
  // }

  void createRecipe(RecipeModel recipe) async {
    _loadingController.sink.add(true);
    await _recipesProvider.createRecipe(recipe);
    _loadingController.sink.add(false);

  }

  dispose(){
    _recipesController?.close();
    _loadingController?.close();
  }
}