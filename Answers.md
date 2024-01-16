Exercice 1 :

Les targets: Les "targets" dans Xcode sont des configurations spécifiques pour votre projet, qui déterminent comment il sera compilé et exécuté. Chaque cible peut avoir ses propres paramètres, dépendances et configurations. Vous pouvez avoir différentes cibles pour des versions de votre application destinées à des plateformes différentes ou avec des fonctionnalités différentes.

Les fichiers: Dans Xcode, les fichiers sont des éléments individuels de votre projet, tels que des classes, des images, des fichiers de configuration, etc. Vous pouvez les organiser dans des groupes pour une meilleure gestion et les ajouter à différents "targets" en fonction de leurs rôles dans l'application.

Les assets: Les "assets" sont des fichiers multimédias tels que des images, des vidéos ou des sons que vous utilisez dans votre application. Ils sont stockés dans un catalogue d'images et peuvent être référencés facilement dans votre code. Cela facilite la gestion des ressources visuelles et sonores de votre application.
Ouvrir le storyboard: Le storyboard est l'interface visuelle de votre application, où vous pouvez concevoir les écrans et les interactions de votre application iOS. Il permet de créer l'interface utilisateur de manière graphique, ce qui est essentiel pour le développement d'applications iOS.

Ouvrir un simulateur: Un simulateur iOS est un outil qui vous permet de tester votre application sur différents appareils iOS directement depuis Xcode, sans avoir besoin d'un appareil physique. Il vous permet de vérifier le fonctionnement de votre application sur différentes tailles d'écran et versions d'iOS.

Lancer une application sur le simulateur: Ce processus consiste à compiler et à exécuter votre application sur le simulateur iOS sélectionné. Cela vous permet de voir comment votre application se comporte et de détecter d'éventuels problèmes ou bogues avant de la publier sur l'App Store.


Exercice 2 : 
1) Cmd + R: Ce raccourci clavier est utilisé pour lancer la compilation et l'exécution de votre projet dans Xcode. Il démarre votre application sur le simulateur ou l'appareil iOS connecté actuellement. Cela permet de tester rapidement les modifications apportées à votre code.
2) 
Cmd + Shift + O: Le raccourci "Cmd + Shift + O" dans Xcode sert à ouvrir rapidement un fichier ou une classe spécifique dans votre projet. Il affiche une boîte de dialogue de recherche qui vous permet de trouver rapidement le fichier que vous recherchez en tapant son nom. Cela vous fait gagner du temps lors de la navigation et de l'édition de fichiers dans un projet Xcode.
3)
Raccourci pour indenter le code automatiquement: Le raccourci pour indenter le code automatiquement dans Xcode est "Cmd + I", clavier Windows : Control + I. Lorsque vous avez sélectionné du code ou que vous êtes à l'intérieur d'un fichier source, vous pouvez utiliser cette combinaison de touches pour réorganiser et aligner correctement le code, ce qui améliore sa lisibilité et sa structure.
4)
Raccourci pour commenter la sélection: Le raccourci pour commenter la sélection dans Xcode est "Cmd + /". Lorsque vous avez du code sélectionné, cette combinaison de touches ajoutera des commentaires de ligne "//" au début de chaque ligne sélectionnée, ou supprimera les commentaires s'ils sont déjà présents. Cela permet de commenter rapidement du code pour des explications ou de le décommenter.

Exercice 3 : 

Une propriété statique en programmation est une variable ou un membre de classe qui est associé à la classe elle-même plutôt qu'à une instance spécifique de cette classe. Cela signifie qu'une seule copie de cette propriété existe en mémoire, partagée par toutes les instances de la classe. L'intérêt d'une propriété statique réside dans plusieurs aspects clés :

Partage de données: Les propriétés statiques permettent de partager des données ou des états entre toutes les instances d'une classe. Cela peut être utile lorsque vous avez besoin de stocker des informations qui sont globales à la classe et ne devraient pas être dupliquées pour chaque instance. Par exemple, une variable comptant le nombre total d'objets créés à partir d'une classe.
Accès global: Les propriétés statiques peuvent être accessibles de n'importe où dans le code, sans avoir besoin d'instancier la classe. Cela facilite l'accès aux données ou aux fonctionnalités fournies par la classe, ce qui peut être pratique dans certaines situations.
Configuration globale: Les propriétés statiques sont souvent utilisées pour stocker des valeurs de configuration globale, telles que des paramètres d'application ou des constantes. Cela permet de centraliser ces valeurs et de les rendre facilement accessibles à tous les composants de l'application.
Optimisation de la mémoire: Comme il n'y a qu'une seule instance de la propriété statique partagée par toutes les instances de la classe, cela peut contribuer à économiser de la mémoire lorsque vous avez besoin de stocker des données qui ne changent pas d'une instance à l'autre.
Gestion d'état: Les propriétés statiques peuvent être utilisées pour gérer l'état global de l'application, tel que le suivi de la connexion utilisateur ou le mode de l'application. Cela permet de garder une vue d'ensemble de l'état de l'application et de prendre des décisions en fonction de cet état.
