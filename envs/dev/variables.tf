variable "aws_region" {
  description = "Region AWS de deploiement"
  type        = string
  default     = "us-east-1"
}

variable "owner" {
  description = "Trigramme du referent AWS, utilise dans les tags"
  type        = string

  validation {
    condition     = can(regex("^[a-z]{3}$", var.owner))
    error_message = "Le trigramme doit etre compose de 3 lettres minuscules."
  }
}

variable "environment" {
  description = "dev ou prod"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment doit valoir dev ou prod."
  }
}

variable "instance_type" {
  description = "Type des instances web (t3.micro en dev, t3.small en prod)"
  type        = string
  default     = "t3.micro"
}

variable "instance_profile_name" {
  description = "Profil d'instance. Learner Lab : LabInstanceProfile, precree (creation de role refusee)."
  type        = string
  default     = "LabInstanceProfile"
}

# Aucune valeur par defaut : la valeur vient de TF_VAR_db_password (secret d'environnement GitHub).
variable "db_password" {
  description = "Secret applicatif, ecrit en ecriture seule dans Parameter Store"
  type        = string
  ephemeral   = true
}
