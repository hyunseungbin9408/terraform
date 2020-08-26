variable "AWS_REGION" {
    type = string
    default = "ap-northeast-2"
}

variable "AWS_ACCESS_KEY" {
    type = string
}

variable "AWS_SECRET_KEY" {
    type = string
}

variable "AMI_IMAGES" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-01c36f3329957b16a",
    ap-northeast-2 = "ami-05438a9ce08100b25"
  }
}