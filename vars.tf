variable AWS_REGION {
    default = "us-east-2"
}

variable AMI_ID {
    type = map
    default = {
        us-east-2 = "ami-0430580de6244e02e"
        us-east-1 = "ami-0261755bbcb8c4a84"
    }
}

variable PRIVATE_KEY_PATH {
    default = "java_key"
}

variable PUBLIC_KEY_PATH {
    default = "java_key.pub"
}

variable USER {
    default = "ubuntu"
}

variable MY_IP {
    default = "172.232.18.0/32"
}

variable RMQ_USER {
    default = "rabbit"
}

variable RMQ_PASSWD {
    default = "Hello@#_Hello@#!@_Hello@#!!#$4"
}

variable DB_PASS {
    default = "admin123"
}

variable DB_USER {
    default = "admin"
}

variable DB_NAME {
    default = "accounts"
}

variable INSTANCE_COUNT {
    default = "1"
}

variable VPC_NAME {
    default = "java-app-vpc"
}

variable ZONE_1 {
    default = "us-east-2a"
}

variable ZONE_2 {
    default = "us-east-2b"
}

variable ZONE_3 {
    default = "us-east-2c"
}

variable VPC_CIDR {
    default = "172.21.0.0/16"
}

variable PUBLIC_SUBNET_1 {
    default = "172.21.1.0/24"
}

variable PUBLIC_SUBNET_2 {
    default = "172.21.2.0/24"
}

variable PUBLIC_SUBNET_3 {
    default = "172.21.3.0/24"
}

variable PRIVATE_SUBNET_1 {
    default = "172.21.4.0/24"
}

variable PRIVATE_SUBNET_2 {
    default = "172.21.5.0/24"
}

variable PRIVATE_SUBNET_3 {
    default = "172.21.6.0/24"
}

