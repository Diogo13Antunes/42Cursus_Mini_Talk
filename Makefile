# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dcandeia <dcandeia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/31 09:59:01 by dcandeia          #+#    #+#              #
#    Updated: 2022/04/12 17:00:37 by dcandeia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = 		mini_talk
CLIENT =	client
SERVER =	server

CC = gcc
CFLAGS = -Wall -Werror -Wextra -g
RM = rm -f

$(VERBOSE).SILENT:

HEADER = mini_talk.h

LIBFT = ./Libft/libft.a
LIBFT_PATH = ./Libft

FT_PRINTF = ./ft_printf/libftprintf.a
FT_PRINTF_PATH = ./ft_printf

INC = -I ./Libft -I ./Includes -I ./ft_printf

SRC_PATH = ./sources

OBJ_PATH = ./objects

SRC_NAME = 	client.c	\
			server.c	\
			utils.c

OBJS = $(addprefix $(OBJ_PATH)/, $(SRC_NAME:.c=.o))

SRC = $(addprefix $(SRC_PATH)/, $(SRC_NAME))

all: $(NAME)

$(LIBFT): $(shell make -C $(LIBFT_PATH) -q libft.a || echo force)
	@make -C $(LIBFT_PATH)

$(FT_PRINTF): $(shell make -C $(FT_PRINTF_PATH) -q libftprintf.a || echo force)
	@make -C $(FT_PRINTF_PATH)

$(SERVER) : objects/server.o objects/utils.o includes/mini_talk.h
	$(CC) $(CFLAGS) objects/server.o objects/utils.o $(INC) $(LIBFT) $(FT_PRINTF) -o $(SERVER)
	@echo "\033[1;36m[SERVER COMPILED]\033[0m"

$(CLIENT) : objects/client.o objects/utils.o includes/mini_talk.h
	$(CC) $(CFLAGS) objects/client.o objects/utils.o $(INC) $(LIBFT) $(FT_PRINTF) -o $(CLIENT)
	@echo "\033[1;36m[CLIENT COMPILED]\033[0m"

$(NAME) : $(LIBFT) $(FT_PRINTF) $(CLIENT) $(SERVER)

$(OBJ_PATH)/%.o : $(SRC_PATH)/%.c
	mkdir -p objects
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	make clean -C $(LIBFT_PATH)
	make clean -C $(FT_PRINTF_PATH)
	rm -rf $(OBJ_PATH)
	echo "\033[33mall $(NAME).o files are removed\033[0m"

fclean: clean
	make fclean -C $(LIBFT_PATH)
	make fclean -C $(FT_PRINTF_PATH)
	rm -f $(NAME)
	rm -f $(SERVER)
	rm -f $(CLIENT)
	echo "\033[31m$(NAME) is deleted\033[0m"

re: fclean all

.PHONY: all, clean, fclean, re, force