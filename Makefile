# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlahin <tlahin@student.hive.fi>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/19 17:34:26 by tlahin            #+#    #+#              #
#    Updated: 2022/05/09 16:57:00 by tlahin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRCS_DIR = srcs/
SRCS =	ft_atoi.c ft_bzero.c ft_isalnum.c ft_isalpha.c \
	ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_toupper.c \
	ft_memalloc.c ft_memccpy.c ft_memchr.c ft_memcmp.c ft_memcpy.c \
	ft_memdel.c ft_memmove.c ft_memset.c ft_putchar.c ft_putchar_fd.c \
	ft_putendl.c ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c ft_itoa_uintmax.c \
	ft_putstr.c ft_putstr_fd.c ft_strcat.c ft_strchr.c ft_ftoa.c ft_intlen_max.c \
	ft_strclr.c ft_strcmp.c ft_strcpy.c ft_strdel.c ft_strdup.c ft_ftoa_helper.c \
	ft_strequ.c ft_striter.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
	ft_strlen.c ft_strmap.c ft_strmapi.c ft_strncat.c ft_strncmp.c ft_abs.c \
	ft_strncpy.c ft_strnequ.c ft_strnew.c ft_strnstr.c ft_strrchr.c \
	ft_strsplit.c ft_strstr.c ft_strsub.c ft_strtrim.c ft_tolower.c \
	get_next_line.c ft_sqrt.c ft_intlen.c ft_strndup.c ft_str_toupper.c \
	ft_itoa_base.c ft_number_size.c ft_number_size_base.c ft_powl.c \
	ft_is_prime.c ft_next_prime.c

PRINTF_DIR = ft_printf/srcs/
PRINTF_SRCS =	ft_printf.c get_modifiers.c \
	utilities_data.c utilities_1.c \
	printer.c check.c print_alternative.c \
	print_char.c print_str.c print_pointer.c \
	print_integer.c print_octal.c \
	print_hex.c print_unsigned.c \
	print_float.c print_else.c \
	padding.c caster.c max.c

OBJS_DIR = objs/
OBJS = $(addprefix $(OBJS_DIR), $(SRCS:.c=.o))
PRINTF_OBJS = $(addprefix $(OBJS_DIR), $(PRINTF_SRCS:.c=.o))

INCLUDES = -I ./includes -I ./ft_printf/includes
CFLAGS = -Wall -Werror -Wextra
CC = gcc

#COLORS:
GREEN := '\033[1;3;32m'
CYAN := '\033[2;3;36m'
RED := '\033[2;3;31m'
RESET := \033[0m

all : $(NAME)

$(NAME) : msg_compiling $(OBJS) $(PRINTF_OBJS)
	@ar rcs $(NAME) $(OBJS) $(PRINTF_OBJS)
	@ranlib $(NAME)
	@echo ${GREEN}"Libft compiled successfully.${RESET}"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

$(OBJS_DIR)%.o : $(PRINTF_DIR)%.c
	@$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES)

msg_compiling :
	@echo ${CYAN}"Building the library.. $(NAME)${RESET}"

clean :
	@echo ${RED}"Removing object files...${RESET}"
	@rm -f $(OBJS) $(PRINTF_OBJS)

fclean : clean
	@echo ${RED}"Removing $(NAME)${RESET}"
	@rmdir $(OBJS_DIR)
	@rm -f $(NAME)

re : fclean all

.PHONY: all clean fclean re