data aws_security_group "sg" {
}
output "sg_result" {
	value=data.aws_security_group.sg.id
}
