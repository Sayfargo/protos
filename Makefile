# p - proto file directory (need full path)
# g - directory to generate code
proto-up:
	@if [ -z "$(p)" ]; then \
		echo "Error: 'p' parameter is missing. Example: make proto-up p=./proto/*.proto"; \
		exit 1; \
	fi
	@if [ -z "$(g)" ]; then \
		echo "Error: 'g' parameter is missing. Example: make proto-up g=./gen/go"; \
		exit 1; \
	fi

	mkdir -p $(g)

	protoc -I proto $(p)/*.proto \
		--go_out=$(g) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(g) \
		--go-grpc_opt=paths=source_relative