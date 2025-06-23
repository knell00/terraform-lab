variable "region" {
  description    = "AWS Region"
  type           = string
  default        = "ap-northeast-2"
}


variable "bucket_name" {
  description = "전역 유일 S3 버킷명"
  type        = string
  default     = "kang-kang-kang-terraform22"
}

variable "dynamodb_table" {
   description   = "DnamoDB Lock 테이블명"
   type          = string
   default       = "terraformlocks"
}
