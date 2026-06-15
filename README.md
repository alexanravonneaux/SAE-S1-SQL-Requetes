# 🗃️ SAE S1 — Requêtes SQL

![Formation](https://img.shields.io/badge/BUT-Science%20des%20données-blue)
![Semestre](https://img.shields.io/badge/Semestre-1-green)
![SQL](https://img.shields.io/badge/SQL-4479A1?logo=mysql&logoColor=white)

**Auteur** : Alexan RAVONNEAUX | **IUT de Niort** – Université de Poitiers | **S1 (2024-2025)**

---

## 📋 Description

Apprentissage et pratique du langage SQL à travers une série de requêtes progressives sur une base de données relationnelle. Ce SAE couvre les fondamentaux du SQL : sélection, filtrage, jointures, agrégations, sous-requêtes et création/modification de schéma.

## 🎯 Objectifs pédagogiques
- Maîtriser les requêtes SELECT avec WHERE, ORDER BY, GROUP BY
- Réaliser des jointures (INNER, LEFT, RIGHT, FULL)
- Utiliser les fonctions d'agrégation (COUNT, SUM, AVG, MAX, MIN)
- Écrire des sous-requêtes et des vues
- Créer et modifier des tables (DDL)

## 🔧 Technologies

| Outil | Rôle |
|-------|------|
| SQL | Langage de requêtes |
| MySQL / PostgreSQL | SGBDR utilisé |
| MySQL Workbench / DBeaver | Interface graphique |

## 📂 Structure

`
SAE6_SQL_Requetes/
├── README.md
├── schema.sql         # Création des tables
├── donnees.sql        # Insertion des données de test
├── requetes/          # Scripts SQL par thème
│   ├── 01_select.sql
│   ├── 02_jointures.sql
│   ├── 03_agregations.sql
│   └── 04_sous_requetes.sql
└── exercices/         # Exercices et corrections
`

## 🚀 Utilisation

`sql
-- Importer le schéma et les données
SOURCE schema.sql;
SOURCE donnees.sql;
-- Puis exécuter les scripts de requêtes
`

## 📊 Résultats
- Maîtrise des requêtes SQL de base à avancé
- Résolution de problèmes complexes avec sous-requêtes et jointures multiples
