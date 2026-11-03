# Règles d'équipe

1. Une branche par changement, une pull request relue par l'autre membre avant de fusionner dans `main`.
2. Un tag Git par séance : `v5.<séance>.0`.
3. Le `.gitignore` est non négociable : `*.tfstate`, `*.tfvars`, `*.pem`, `.env`, inventaires générés.
4. Aucun secret en clair, nulle part (code, state, user_data, logs).
5. Le plan se lit en entier avant tout `apply`.
6. `terraform destroy` ou `scripts/stop-evening.sh` avant de quitter : ALB, NAT Gateway et ASG sont facturés à l'heure.
7. Le state est distant : bucket S3 `novasphere-tfstate-afr`, versionné, verrouillage natif (`use_lockfile = true`).
8. L'argument `dynamodb_table` du backend S3 est déprécié : on ne le reproduit pas.
9. Un verrou ne se lève (`terraform force-unlock`) qu'après vérification que personne n'a d'opération en cours.
10. Région AWS du module : `us-east-1`.
