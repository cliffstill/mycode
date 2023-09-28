/* Alta3 Research - rzfeeser@alta3.com
Working with "for_each" within a null_resource */

/* Terraform block */
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/* a list of local variables */
locals {
  avengers = { "ironman" = "hero"
    "captain america" = "hero"
    "thanos"          = "villain"
    "venom"           = "anti-hero"
  }
}


locals { rgs = {
  "alpha"   = "eastus"
  "bravo"   = "southindia"
  "charlie" = "westus2"
} }

resource "null_resource" "dummy_rgs" {
  for_each = tomap(local.rgs)
  triggers = {
    name   = each.key
    region = each.value
  }
}

output "dummy_rgs" {
  value = null_resource.dummy_rgs
}


/* The null_resource implements the standard resource lifecycle but takes no more action */
resource "null_resource" "avengers" {
  for_each = local.avengers // local is not a typo, locals.avengers would be incorrect
  /* triggers allows specifying a random set of values that when
     changed will cause the resource to be replaced */
  triggers = {
    name = each.key // a special variable, "each" created by terraform
    // the object has "each.key" and "each.value"
    status = each.value
  }
}

/* We want these outputs */
output "avengers" {
  value = null_resource.avengers
}

