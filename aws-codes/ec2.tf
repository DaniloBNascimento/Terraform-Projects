resource "aws_instance" "server" {
    count = 3 # create four similar EC2 instance

    ami           = "ami-02c8813f1ea04d4ab"
    instance_type = "t2.medium"
    tags = {
        Name = "Server ${count.index}"
    }
}