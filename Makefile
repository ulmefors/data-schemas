.PHONY: clean dir gen

SRC_DIR=src/proto/state
GEN_GO_DIR = gen-go
GEN_PYTHON_DIR = gen-python
GEN_JAVA_DIR = gen-java

all: clean dir gen

gen: dir
	protoc -I=$(SRC_DIR) --python_out=$(GEN_PYTHON_DIR) $(SRC_DIR)/state.proto
	protoc -I=$(SRC_DIR) --go_out=$(GEN_GO_DIR) $(SRC_DIR)/state.proto
	protoc -I=$(SRC_DIR) --java_out=$(GEN_JAVA_DIR) $(SRC_DIR)/state.proto

clean:
	rm -r $(GEN_GO_DIR) || true
	rm -r $(GEN_PYTHON_DIR) || true
	rm -r $(GEN_JAVA_DIR) || true

dir:
	mkdir $(GEN_GO_DIR) || true
	mkdir $(GEN_PYTHON_DIR) || true
	mkdir $(GEN_JAVA_DIR) || true
