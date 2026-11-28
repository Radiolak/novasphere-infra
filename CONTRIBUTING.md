# Règles d'équipe

1. Une branche par changement : `feat/...` ou `fix/...`. Jamais de commit direct sur `main` (la protection le refuse).
2. Une pull request relue et approuvée par l'autre membre avant le merge : Alexis (lots 2 et 4) relit Boran (lots 1 et 3), et inversement.
3. Le relecteur lit le plan posté en commentaire, ligne par ligne (`~`, `+`, `-`), puis le résumé, avant d'approuver.
4. Chacun commite depuis son poste, sous son nom (`git config user.name` et `user.email`).
5. Avant chaque commit : `terraform fmt -recursive`. La CI refuse un fichier mal formaté.
6. `envs/dev` et `envs/prod` ont le même code. Toute modification de l'un est faite dans l'autre, dans la même pull request. Seuls `backend.tf` (la clé) et `terraform.tfvars.example` diffèrent.
7. Jamais commité : `*.tfstate*`, `*.tfvars`, `*.pem`, `.env`, `.terraform/`, `tfplan`, `plan.txt`, `scan-*.txt`.
8. Aucun secret en clair, nulle part : code, state, script de démarrage, historique Git, logs de CI, messages, tickets.
9. Aucun `terraform apply` depuis un poste. Le déploiement passe par la CI. Le référent AWS fait seulement la destruction de fin de session et le diagnostic.
10. `terraform force-unlock` seulement après avoir vérifié avec toute l'équipe que personne n'a d'opération en cours.
11. Fin de session : destruction de `envs/dev` et `envs/prod` (le bucket de state reste). Un ALB oublié consomme le budget du lab.
12. Le module vit dans `Radiolak/terraform-aws-web-stack`. Un tag publié (`vX.Y.Z`) ne change jamais. Une correction donne un nouveau tag.
13. L'argument `dynamodb_table` du backend S3 est déprécié : le verrou utilise `use_lockfile = true`.
