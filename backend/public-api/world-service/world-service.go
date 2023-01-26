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

		pf := &errdetails.PreconditionFailure{}
		pf.Violations = append(
			pf.Violations,
			&errdetails.PreconditionFailure_Violation{
				Type:    publicApiHello.FailPrecondition_FAIL_PRECONDITION_NAME.String(),
				Subject: "Name is empty",
			},
		)

		withDetails, err := s.WithDetails(pf)
		if err != nil {
			log.Panic(err)
		}

		log.Printf("withDetails: %s", withDetails.String())
		log.Printf("withDetails: %s", withDetails.Details())
		log.Println(fmt.Errorf("withDetails: %w", withDetails.Err()))

		return nil, withDetails.Err()
	}

	myName := authorizations[1]

	return &publicApiHello.MyNameResponse{AuthName: myName}, nil
}
