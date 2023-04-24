# Собираем все proto-файлы
PROTO_FILES := $(shell find ./proto -type f -name '*.proto' | sed 's|^./proto/||')

.SILENT: install-core
.SILENT: go-clean go-gen go-install
.SILENT: dart-clean dart-gen-core dart-gen dart-install

all-gen: go-gen dart-gen

go-clean:
	find go ! -name go.mod ! -name go.sum -delete 2>/dev/null || ::
	rm go.mod 2>/dev/null || ::

install-core:
	go mod init test
	go get -u google.golang.org/protobuf/proto 2>/dev/null && go install google.golang.org/protobuf/proto
	go get -u golang.org/x/tools/cmd/stringer 2>/dev/null && go install golang.org/x/tools/cmd/stringer
	go get -u github.com/searKing/golang/tools/go-enum 2>/dev/null && go install github.com/searKing/golang/tools/go-enum
	rm go.mod go.sum

go-install: install-core
	mkdir -p go && cd go && touch go.mod &&	go mod edit -module=name.alenkov.samples/go-and-flutter-grpc/public-api
	cd go/ && go get -u google.golang.org/protobuf/cmd/protoc-gen-go@latest && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	cd go/ && go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	cd go/ && go get -u github.com/nefixestrada/protoc-gen-go-grpc-mock@latest && go install github.com/nefixestrada/protoc-gen-go-grpc-mock@latest

go-gen: go-clean go-install go-gen-proto
	cd go && go mod tidy

go-gen-proto:
	protoc --proto_path=proto --go_out=go --go_opt=paths=source_relative --go-grpc_out=go --go-grpc_opt=paths=source_relative $(PROTO_FILES)

# Dart
dart-clean:
	rm -Rf dart/lib/src/generated/*

dart-install: install-core
	[ -d dart ] || (dart create -t package public_api >/dev/null && mv public_api dart)
	rm -Rf dart/example/ dart/test/ dart/*.md
	find dart -name '*.dart' -type f -delete

	mkdir -p dart/lib/src/generated/

	cd dart && dart pub add protobuf http2 grpc || ( echo 'run pub upgrade...' && dart pub upgrade >/dev/null )

	dart pub global activate protoc_plugin >/dev/null

dart-gen: dart-clean dart-install
	make dart-gen-proto
	cd dart && dart format lib/src/generated

dart-gen-proto:
	protoc --proto_path=proto --dart_out=grpc:dart/lib/src/generated $(PROTO_FILES)
