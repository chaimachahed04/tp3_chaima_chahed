# tp4_Chaima-Chahed_Rada-Ben-Maiz

Ce projet est un **jeu de plateforme 2D inspiré de Mario**, développé avec **Godot 4**.  
Les ennemis classiques (Goombas) sont remplacés par des **escargots (snails)** et les pièces par des **pommes**.  
Le jeu inclut un **système de score**, un **menu principal** et un **écran de Game Over**.

Ce README explique **comment le jeu fonctionne**, pas comment le coder ligne par ligne.

---

## 🎮 Concept du jeu

Le joueur contrôle un personnage qui peut :
- Se déplacer à gauche et à droite
- Sauter sur des plateformes
- Éliminer des ennemis en sautant dessus
- Collecter des pommes pour augmenter son score

L’objectif est de survivre, accumuler un maximum de points et éviter de perdre toutes ses vies.

---

## 🧱 Structure générale du jeu

Le jeu est organisé en plusieurs **scènes Godot** :
- Une scène **Menu**
- Une scène **Niveau principal**
- Une scène **Game Over**

Chaque scène a un rôle précis et communique avec les autres via des signaux ou un gestionnaire global.

---

## 🧍‍♂️ Le joueur

Le joueur est basé sur un personnage 2D avec :
- Un système de **gravité**
- Des **collisions** avec le sol, les ennemis et les objets
- Une détection de saut sur les ennemis

### Fonctionnement
- Le joueur perd une vie s’il touche un escargot sur le côté
- Il élimine un escargot s’il lui saute dessus
- Lorsqu’il tombe dans le vide ou perd toutes ses vies → Game Over

---

## 🐌 Les ennemis (Snails)

Les escargots remplacent les Goombas classiques.

### Comportement
- Ils se déplacent automatiquement dans une direction
- Ils changent de direction lorsqu’ils touchent un mur
- Ils peuvent être éliminés si le joueur leur saute dessus

Ils utilisent :
- Une **collision simple**
- Un mouvement horizontal constant
- Une interaction directe avec le joueur

---

## 🍎 Les collectibles (Pommes)

Les pommes remplacent les pièces.

### Fonctionnement
- Elles sont statiques dans le niveau
- Lorsqu’un joueur les touche :
  - Elles disparaissent
  - Le score augmente

Les pommes servent uniquement à augmenter le score, pas les vies.

---

## ⭐ Système de score

Le score est un élément central du jeu.

### Le score augmente quand :
- Le joueur collecte une pomme
- Le joueur élimine un escargot

### Gestion du score
- Le score est stocké dans une variable globale
- Il est affiché à l’écran pendant la partie
- Il est réinitialisé lors d’un nouveau lancement de partie

---

## 🧭 Menu principal

Le menu est la première scène affichée au lancement du jeu.

### Il contient :
- Un bouton **Jouer**
- (Optionnel) Un bouton **Quitter**

### Fonctionnement
- Cliquer sur *Jouer* charge la scène du niveau
- Le menu ne contient pas de gameplay, uniquement de la navigation

---

## 💀 Game Over

L’écran de Game Over apparaît lorsque :
- Le joueur n’a plus de vies
- Ou tombe hors du niveau

### Il affiche :
- Un message *Game Over*
- Le score final
- Un bouton pour revenir au menu ou recommencer

Le Game Over permet de :
- Terminer proprement une partie
- Réinitialiser les variables importantes (score, vies)

---

## 🔄 Gestion des scènes

Le jeu repose sur :
- Des **changements de scènes**
- Des **variables globales** (score, vies)
- Des **signaux** pour communiquer entre objets (joueur, ennemis, UI)

Cela permet un projet clair, modulable et facile à améliorer.

---

## 🚀 Extensions possibles

- Ajouter plusieurs niveaux
- Ajouter des power-ups
- Sauvegarder le meilleur score
- Ajouter des sons et de la musique
- Ajouter des animations plus avancées

---

## 🛠️ Moteur utilisé

- **Godot Engine 4.x**
- Jeu 2D
- GDScript

---

## 📄 Licence

Projet éducatif / personnel  
Libre à modifier et améliorer

