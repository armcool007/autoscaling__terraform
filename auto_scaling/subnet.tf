data "aws_subnets" "subnet" {
filter {
	name="vpc-id"
	values=[data.aws_vpc.vpc.id]
}
filter {
	name="map-public-ip-on-launch"
	values=["true"]
}
}

