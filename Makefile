# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hwong <hwong@student.42kl.edu.my>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/18 14:47:20 by hwong             #+#    #+#              #
#    Updated: 2022/10/18 14:47:20 by hwong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libftprintf.a

SRC_DIR	= src
OBJ_DIR	= objs

OBJ_DIRS= $(subst $(SRC_DIR), $(OBJ_DIR), $(shell find src -type d))
SRC		= $(shell find $(SRC_DIR) -name '*.c')
OBJ		= $(subst $(SRC_DIR), $(OBJ_DIR), $(SRC:.c=.o))

CC		= gcc
CFLAGS	= -Wall -Werror -Wextra
RM		= rm -f
INC		= -I includes

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c
				@mkdir -p $(OBJ_DIRS)
				$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(NAME):	$(OBJ)
			@ar -rcs $(NAME) $(OBJ)
#			ranlib $(NAME)

all:	$(NAME)

clean:
		@$(RM) $(OBJ)

fclean:	clean
		$(RM) $(NAME)
		$(RM) -r $(OBJ_DIR)

re:			fclean all