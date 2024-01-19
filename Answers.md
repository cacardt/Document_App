Exercice 1 :

Les targets: Les "targets" dans Xcode sont des configurations spécifiques pour le projet, qui déterminent comment il sera compilé et exécuté. Chaque cible peut avoir ses propres paramètres, dépendances et configurations. nous pouvons avoir différentes cibles pour des versions de le application destinées à des plateformes différentes ou avec des fonctionnalités différentes.

Les fichiers: Dans Xcode, les fichiers sont des éléments individuels de le projet, tels que des classes, des images, des fichiers de configuration, etc. nous pouvons les organiser dans des groupes pour une meilleure gestion et les ajouter à différents "targets" en fonction de leurs rôles dans l'application.

Les assets: Les "assets" sont des fichiers multimédias tels que des images, des vidéos ou des sons que nous utilisez dans le application. Ils sont stockés dans un catalogue d'images et peuvent être référencés facilement dans le code. Cela facilite la gestion des ressources visuelles et sonores de le application.

Ouvrir le storyboard: Le storyboard est l'interface visuelle de le application, où nous pouvons concevoir les écrans et les interactions de l'application iOS. Il permet de créer l'interface utilisateur de manière graphique, ce qui est essentiel pour le développement d'applications iOS.

Ouvrir un simulateur: Un simulateur iOS est un outil qui nous permet de tester l'application sur différents appareils iOS directement depuis Xcode, sans avoir besoin d'un appareil physique. Il nous permet de vérifier le fonctionnement de l'application sur différentes tailles d'écran et versions d'iOS.

Lancer une application sur le simulateur: Ce processus consiste à compiler et à exécuter l'application sur le simulateur iOS sélectionné. Cela nous permet de voir comment l'application se comporte et de détecter d'éventuels problèmes ou bugs avant de la publier sur l'App Store.


Exercice 2 : 

1) Cmd + R: Ce raccourci clavier est utilisé pour lancer la compilation et l'exécution du projet dans Xcode. Il démarre l'application sur le simulateur ou l'appareil iOS connecté actuellement. Cela permet de tester rapidement les modifications apportées au code.
2) 
Cmd + Shift + O: Le raccourci "Cmd + Shift + O" dans Xcode sert à ouvrir rapidement un fichier ou une classe spécifique dans le projet. Il affiche une boîte de dialogue de recherche qui nous permet de trouver rapidement le fichier que nous recherchons en tapant son nom. Cela nous fait gagner du temps lors de la navigation et de l'édition de fichiers dans un projet Xcode.
3)
Raccourci pour indenter le code automatiquement: Le raccourci pour indenter le code automatiquement dans Xcode est "Cmd + I", clavier Windows : Control + I. Lorsque nous avons sélectionné du code ou que nous sommes à l'intérieur d'un fichier source, nous pouvons utiliser cette combinaison de touches pour réorganiser et aligner correctement le code, ce qui améliore sa lisibilité et sa structure.
4)
Raccourci pour commenter la sélection: Le raccourci pour commenter la sélection dans Xcode est "Cmd + /". Lorsque nous avons du code sélectionné, cette combinaison de touches ajoutera des commentaires de ligne "//" au début de chaque ligne sélectionnée, ou supprimera les commentaires s'ils sont déjà présents. Cela permet de commenter rapidement du code pour des explications ou de le décommenter.

Exercice 3 : 

1)Une propriété statique en programmation est une variable ou un membre de classe associé à la classe plutôt qu'à une instance spécifique. Elle permet de partager des données entre toutes les instances de la classe, offre un accès global, stocke des valeurs de configuration globale, optimise la mémoire, et gère l'état global de l'application.



2)dequeueReusableCell est importante pour les performances d'une application Swift car elle permet d'optimiser l'utilisation de la mémoire, de réduire la charge sur le processeur et d'améliorer la fluidité de l'interface utilisateur en recyclant efficacement les cellules plutôt qu'en en créant de nouvelles à chaque fois.

Exercice 4 :

1) Nous venons d'ajouter un NavigationController à notre application. Son rôle est de gérer la navigation entre différentes pages de l'application, de gérer l'empilement et le dépilement des vues, d'ajouter des boutons de navigation, une barre d'outils, et de gérer les transitions entre les vues.
   
2) La NavigationBar n'est pas la même chose que le NavigationController. La NavigationBar est une composante visuelle spécifique à une vue particulière qui fait partie de l'apparence de cette vue. Elle contient généralement des éléments tels que le titre de la page, des boutons de navigation (par exemple, le bouton "Retour"), et d'autres éléments liés à la navigation. Le NavigationController, en revanche, est responsable de la gestion de la navigation globale de l'application, y compris la gestion de plusieurs vues et la navigation entre elles.

Exercice 6: 

1) Un Segue est un moyen de créer une transition ou un lien entre deux ViewControllers. Il détermine comment une vue doit être affichée ou présentée en réponse à une action de l'utilisateur, comme un bouton pressé. Les Segues facilitent la navigation entre les écrans de l'application et la transmission de données entre les ViewControllers. Ils jouent un rôle essentiel dans la création d'une expérience utilisateur fluide et intuitive.
2) Une contrainte dans le contexte d'AutoLayout est une règle qui définit la disposition et la taille des éléments de l'interface utilisateur. Elle sert à positionner, dimensionner et définir les relations entre les éléments. AutoLayout est un système de gestion des contraintes utilisé dans le développement iOS et macOS pour créer des mises en page adaptatives et réactives. Il garantit que les éléments s'ajustent correctement à différentes tailles d'écran et orientations, offrant ainsi une expérience utilisateur cohérente.

Exercice 9 :

1) Il serait plus pertinent de changer l'accessory de nos cellules pour un disclosureIndicator dans le contexte de l'utilisation d'un QLPreviewController pour afficher les détails des documents sélectionnés, car cela correspondrait davantage à la convention de conception d'interface utilisateur recommandée par Apple pour une expérience utilisateur plus cohérente et intuitive. En remplaçant l'accessory par un disclosureIndicator, on signale visuellement que chaque cellule est interactive et qu'elle conduit à une action supplémentaire, comme l'affichage du document en détail dans le QLPreviewController.En utilisant cette convention, l'application iOS sera plus conforme aux attentes des utilisateurs et offrira une meilleure expérience utilisateur.


Exercice 10 :

1) Il est utilisé pour indiquer quelle méthode doit être appelée en réponse à un événement et permet de lier dynamiquement la fonction à un événement ou à une action particulière.
   
2)  .add dans barButtonSystemItem représente le type de système de l'icône du bouton. Il indique que nous voulons utiliser l'icône de plus (+) standard pour ajouter des éléments.

3)  Xcode demande de mettre le mot clé @objc devant la fonction ciblée par le #selector parce que les fonctions utilisées comme cibles d'actions doivent être exposées à l'Objective-C. Cela lui permet de comprendre et de réagir correctement à la fonction Swift lorsque l'action du bouton est déclenchée.
   
4)  Oui, il est possible d'ajouter plusieurs boutons dans la barre de navigation en code. Pour cela, nous pouvons créer un tableau de UIBarButtonItem et les assigner à la propriété rightBarButtonItems ou leftBarButtonItems de l'objet navigationItem. Cela nous permet d'ajouter plusieurs boutons à la barre de navigation à droite ou à gauche de manière programmée.
   
5)  La fonction `defer` en Swift est utilisée pour reporter l'exécution d'un bloc de code jusqu'à la fin du contexte courant, assurant ainsi que certaines actions de nettoyage ou de gestion des ressources sont toujours effectuées, même en cas d'erreur ou de sortie anticipée de la fonction. Elle garantit que des opérations importantes, telles que la fermeture de fichiers ou la libération de ressources, sont exécutées de manière fiable avant la fin d'une portée ou d'une fonction.
