package main

import (
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	publicApiHello "name.alenkov.samples/go-and-flutter-grpc/public-api/hello"
	worldService "name.alenkov.samples/go-and-flutter-grpc/public-api/world-service"
)

func main() {
	listen, err := net.Listen("tcp", "127.0.0.1:9000")
	if err != nil {
		log.Panicf("failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()

	// disable in production mode
	reflection.Register(grpcServer)

	publicApiHello.RegisterHelloWorldServiceServer(grpcServer, worldService.NewHelloWorldService())

	log.Printf("server listening at %v", listen.Addr())

	for s, info := range grpcServer.GetServiceInfo() {
		fmt.Printf("service: %s , info: %+v\n", s, info)
	}

	if err := grpcServer.Serve(listen); err != nil {
		log.Panicf("failed to serve: %v", err)
	}
}
