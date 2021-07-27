output "mymachine-dns" {
  value = "${aws_instance.mymachine.public_dns}"
}
