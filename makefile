#Compiler check
CHECK_COMPILER := $(shell which gcc)

# Проверка наличия stdio.h
CHECK_STDIO := $(shell echo "#include <stdio.h>" | gcc -E - > /dev/null 2>&1; echo $$?)

ifeq ($(CHECK_STDIO),1)
	$(error "stdio.h not found. Please install glibc or libc6-dev.")
endif

# Проверка наличия stdlib.h
CHECK_STDLIB := $(shell echo "#include <stdlib.h>" | gcc -E - > /dev/null 2>&1; echo $$?)

ifeq ($(CHECK_STDLIB),1)
	$(error "stdlib.h not found. Please install glibc or libc6-dev.")
endif

ifeq ($(CHECK_COMPILER),)
$(error "gcc not found.")
endif

#Компилятор
CC = gcc

# Флаги компиляции
CFLAGS = -Wall -Wextra -std=c99 -O2

# Имя исполняемого файла
TARGET = bubblesort

# Исходный файл
SRC = bubblesort.c

# Сборка программы
all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

# Очистка (удаление скомпилированного файла)
clean:
	rm -f $(TARGET)

# Правило для пересборки
rebuild: clean all
