#!/bin/bash

# 监听 save 命令的文件
SAVE_COMMAND_PIPE='/home/beta/terraria/Worlds/save_commands_pipe'

while true; do
  if [ -f "$SAVE_COMMAND_PIPE" ]; then
    command=$(head -n 1 "$SAVE_COMMAND_PIPE")
    if [ "$command" == "save" ]; then
      # 使用 docker exec 发送 save 命令到 Terraria 服务器
      docker exec terraria-server /bin/bash -c 'save'
      # 清空文件内容
      echo "" > "$SAVE_COMMAND_PIPE"
    fi
  fi
  sleep 1
done
