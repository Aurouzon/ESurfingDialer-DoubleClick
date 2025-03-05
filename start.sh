#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

JAVA_PATH="$SCRIPT_DIR/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home/bin/java"

JAR_PATH="$SCRIPT_DIR/ESurfingDialer-1.8.0-all.jar"

CONFIG_FILE="$SCRIPT_DIR/config.txt"

if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    read -p "请输入用户名: " USERNAME
    read -p "请输入密码: " PASSWORD
    echo  -e "USERNAME=\"$USERNAME\"\nPASSWORD=\"$PASSWORD\"" > "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE" # 保护配置文件权限
    echo "配置已保存。"
fi

echo "正在执行..."

sudo "$JAVA_PATH" -jar "$JAR_PATH" -u "$USERNAME" -p "$PASSWORD"
