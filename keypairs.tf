resource "aws_key_pair" "java-app-key" {
    key_name = "java-app-key"
    public_key = file(var.PRIVATE_KEY_PATH)
}

