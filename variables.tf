/*
  Provider Variables 
*/
variable "product_id" {
  type = string
  # 'prd_SPM' = Ion Premier product code
  default = "prd_SPM"
}

variable "enrollment_id" {
  # The enrollment ID as defined in CPS
  default = 74470
}

/*
  Provide variable replacement for ruletree
*/

variable "origin" { 
  default = "origin-www.example.com"
}

variable "mpulse-api" {
  default = "AAAAA-BBBBB-CCCCC-DDDDD-EEEEE"
}