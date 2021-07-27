resource "aws_key_pair" "mykeypair"{
   key_name = "mykey"
   public_key = file(var.path_to_public_key)
}