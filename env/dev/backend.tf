terraform {
  backend "s3" {
    bucket         = "kang-kang-kang-terraform22"   # bootstrap에서 만든 버킷
    key            = "dev/terraform.tfstate"  # 상태 파일 경로 (폴더처럼)
    region         = "ap-northeast-2"
    dynamodb_table = "terraformlocks"         # 락 테이블 이름
    encrypt        = true
  }
}
