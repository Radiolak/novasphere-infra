# Sécurité

## Les secrets et où ils vivent
| Secret | Emplacement |
|---|---|
| Identifiants de session du lab | `~/.aws/credentials` du référent AWS, secrets GitHub `AWS_*` |
| Mot de passe applicatif | Secret GitHub `DB_PASSWORD`, SSM `/novasphere/<env>/db_password` (SecureString), `/etc/novasphere/app.conf` (640, root) sur l'instance |

## Politique IAM que l'instance devrait avoir
    {"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":"ssm:GetParameter",
    "Resource":"arn:aws:ssm:us-east-1:<compte>:parameter/novasphere/dev/*"}]}

Pour prod, le chemin est `/novasphere/prod/*`. Le lab impose `LabInstanceProfile` (rôle `LabRole`), plus large.
Session Manager demande des droits en plus (`AmazonSSMManagedInstanceCore`).

## Authentification de la CI et écart avec OIDC
Dans le lab, la CI utilise des identifiants de session stockés en secrets, renouvelés à chaque Start Lab.
Le lab refuse la création du fournisseur OIDC. Dans un compte classique, OIDC donne un jeton court sans clé stockée.
La condition `sub` indique quel dépôt demande le jeton.
AWS accepte seulement le dépôt `Radiolak/novasphere-infra`.
Un autre dépôt ne peut pas prendre le rôle.

## Résultats du scan et traitement de chacun
À compléter.

## Journaux publics de CI
Le dépôt est public, ses journaux aussi. GitHub masque les secrets. Le plan n'affiche pas une valeur en écriture seule.
L'identifiant du compte peut apparaître.

## Dérives traitées
À compléter.
