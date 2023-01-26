package worldService

import (
	"context"
	"fmt"
	"log"
	"strings"

	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	publicApiCore "name.alenkov.samples/go-and-flutter-grpc/public-api/core"
	publicApiHello "name.alenkov.samples/go-and-flutter-grpc/public-api/hello"
)

type HelloWorldService struct {
	publicApiHello.HelloWorldServiceServer
}

func NewHelloWorldService() *HelloWorldService {
	return &HelloWorldService{}
}

func (receiver *HelloWorldService) MyName(ctx context.Context, _ *publicApiCore.Empty) (*publicApiHello.MyNameResponse, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return &publicApiHello.MyNameResponse{AuthName: "anonymous"}, nil
	}

	fmt.Printf("md: %++v\n", md)

	mdAuthorization := md.Get("authorization")

	log.Printf("mdAuthorization: %q\n", mdAuthorization)

	if len(mdAuthorization) != 1 {
		return nil, status.Error(codes.InvalidArgument, fmt.Sprintf("Expected 1 element in Header `authorization`"))
	}

	authorizations := strings.Split(mdAuthorization[0], " ")

	if len(authorizations) != 2 {
		log.Println("return fail...")

		s := status.New(codes.FailedPrecondition, "require name")

		withDetails, err := s.WithDetails(
			&errdetails.PreconditionFailure{
				Violations: []*errdetails.PreconditionFailure_Violation{
					{
						Type:    publicApiHello.FailPrecondition_FAIL_PRECONDITION_NAME.String(),
						Subject: "Name is empty",
					},
				},
			},
		)
		if err != nil {
			log.Panic(err)
		}

		return nil, withDetails.Err()
	}

	myName := authorizations[1]

	return &publicApiHello.MyNameResponse{AuthName: myName}, nil
}
