# Starter theme Wordpress

## Introduction

Au niveau des assets, le dossier gulpfile.js traditionnel viendra les générer depuis le dossier sources.

## Prérequis

node v8.1.1

	nvm install 8.1.1

npm v5.2.0

gulp CLI v3.9.1

	npm install -g gulp@3.9.1

## Installation

	npm i

Relancer la commande s'il manque des modules. Par exemple, si gulp renvoie un message d'erreur comme `Error: Cannot find module 'acorn'`.

## Mode développement
	cmd.exe
	D:\Sources\Aquatiris\MVC\FactorNET\trunk\js\GULP
	gulp

ou  

	gulp [tâche]

## après exécutions

	Copier assets/javascripts dans js/assets
	Copier assets/stylesheets dans css
	les fonts et les images ne sont pas maintenues avec gulp

## debug
	Commenter la ligne : .pipe(uglify().on('error', util.log))
	dans tasks/javascripts.js et relancer 
	gulp javascripts
	
## Tâches gulp

* `images` : optimise et copie les images présentes dans le dossier `sources/images` vers le dossier `assets/images`.
* `stylesheets` : compile, préfixe, minifie et copie les fichiers `.scss` présents dans le dossier `sources/stylesheets` (+ node_modules) vers le dossier `assets/stylesheets`.
* `javascripts` : uglifie et concatène (sprockets like) les fichiers javascripts présents dans le dossier `sources/javascripts` (+ node_modules) vers le dossier `assets/javascripts`.
* `watch` : écoute les dossiers `sources/images`, `sources/stylesheets` et `sources/javascripts`.
* `livereload` : rafraîchi le navigateur lors de la modification des assets et des fichiers `.php` du thème.
* `build` : lance les tâches `images`, `stylesheets` et `javascripts`.
* `server` (défaut) : lance les tâches `build`, `watch` et `livereload`.