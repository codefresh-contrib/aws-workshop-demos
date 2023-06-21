build-app: src/sample/trivial-web-server.go
	go build -o sample src/sample/trivial-web-server.go

build-image:
	packer init .
	packer build aws-packer-example.pkr.hcl

run-image:  
	./launch-it.sh