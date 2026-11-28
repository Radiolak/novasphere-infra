# Secret applicatif de l'environnement. Chemin : /novasphere/<environment>/db_password.
# value_wo : la valeur part vers AWS et n'est gardee ni dans le plan ni dans le state.
# Terraform ne voit pas un changement de valeur : pour changer le secret, incrementer value_wo_version.
resource "aws_ssm_parameter" "db_password" {
  name             = "/novasphere/${var.environment}/db_password"
  type             = "SecureString"
  value_wo         = var.db_password
  value_wo_version = 1
}

# Role d'instance : profil precree LabInstanceProfile (Learner Lab, IAM verrouille).
# Version au moindre privilege pour un compte classique : iam_compte_classique.tf.exemple
