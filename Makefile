.PHONY: help install kitex thrift lint clean validate check

GOBIN := $(shell go env GOPATH)/bin
KITEX := $(GOBIN)/kitex
THRIFT_FILES := $(shell find . -type f -name '*.thrift' 2>/dev/null)
IDL_DIRS := $(shell find . -type d -not -path './kitex_gen/*' 2>/dev/null)

help:
	@echo "Kouleen IDL - Makefile 命令列表"
	@echo "================================"
	@echo ""
	@echo "  make install     安装 Kitex 代码生成工具"
	@echo "  make kitex       生成所有 Thrift 文件的 Kitex SDK"
	@echo "  make thrift      使用 Apache Thrift 编译器生成代码"
	@echo "  make lint        校验 Thrift 文件语法（通过 kitex 编译检查）"
	@echo "  make validate    校验网关 YAML 配置"
	@echo "  make check       执行完整检查（lint + validate）"
	@echo "  make clean       清理 kitex_gen 生成目录"
	@echo ""
	@echo "示例："
	@echo "  make install && make kitex     首次安装并生成 SDK"
	@echo "  make check                     提交前校验"

install:
	@echo "==> 安装 Kitex 工具..."
	go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
	@echo "==> Kitex 安装完成: $(KITEX)"

kitex: install
	@echo "==> 生成 Kitex SDK..."
	@mkdir -p kitex_gen
	@for file in $(THRIFT_FILES); do \
		echo "    processing $$file"; \
		$(KITEX) -module github.com/kouleen/idl -client "$$file"; \
	done
	@echo "==> Kitex SDK 生成完成，输出目录: kitex_gen/"

thrift:
	@echo "==> 使用 Apache Thrift 编译器生成 Go 代码..."
	@if command -v thrift > /dev/null 2>&1; then \
		for file in $(THRIFT_FILES); do \
			echo "    processing $$file"; \
			thrift -r --gen go -out ./gen-go "$$file"; \
		done; \
		echo "==> Thrift 代码生成完成，输出目录: gen-go/"; \
	else \
		echo "    错误: 未检测到 thrift 编译器。请先安装 Apache Thrift:"; \
		echo "      macOS:   brew install thrift"; \
		echo "      Linux:   apt-get install thrift-compiler"; \
		echo "      Windows: 下载 https://thrift.apache.org/download"; \
		exit 1; \
	fi

lint: install
	@echo "==> 校验 Thrift 文件语法..."
	@for file in $(THRIFT_FILES); do \
		echo "    checking $$file"; \
		$(KITEX) -module github.com/kouleen/idl -client "$$file" -o /dev/null 2>&1 || { \
			echo "    错误: $$file 存在语法问题"; \
			exit 1; \
		}; \
	done
	@echo "==> 所有 Thrift 文件语法校验通过"

validate:
	@echo "==> 校验网关 YAML 配置..."
	@HAS_YAML=0; \
	python3 -c "import yaml" 2>/dev/null && HAS_YAML=1 || true; \
	if [ -f gateway/services.yaml ]; then \
		if [ $$HAS_YAML -eq 1 ]; then \
			python3 -c "import yaml; yaml.safe_load(open('gateway/services.yaml'))" 2>/dev/null && \
				echo "    gateway/services.yaml 格式正确" || \
				echo "    错误: gateway/services.yaml 格式有误"; \
		else \
			grep -q 'servers:' gateway/services.yaml && \
				echo "    gateway/services.yaml 格式正确" || \
				echo "    错误: gateway/services.yaml 格式有误"; \
		fi; \
	else \
		echo "    警告: gateway/services.yaml 不存在"; \
	fi; \
	if [ -f gateway/white-path.yaml ]; then \
		if [ $$HAS_YAML -eq 1 ]; then \
			python3 -c "import yaml; yaml.safe_load(open('gateway/white-path.yaml'))" 2>/dev/null && \
				echo "    gateway/white-path.yaml 格式正确" || \
				echo "    错误: gateway/white-path.yaml 格式有误"; \
		else \
			grep -q 'white_path:' gateway/white-path.yaml && \
				echo "    gateway/white-path.yaml 格式正确" || \
				echo "    错误: gateway/white-path.yaml 格式有误"; \
		fi; \
	else \
		echo "    警告: gateway/white-path.yaml 不存在"; \
	fi; \
	echo "==> 网关配置校验完成"

check: lint validate
	@echo "==> 全部检查通过 ✓"

clean:
	@echo "==> 清理生成目录..."
	@rm -rf kitex_gen gen-go
	@echo "==> 清理完成"