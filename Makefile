##
## EPITECH PROJECT, 2022
## wolfram
## File description:
## Makefile
##

RM	=	rm -f

NAME	=	wolfram

EXE_PATH	=	$(shell stack path --local-install-root)/bin/Wolfram-exe

PHONY	=	all

all: $(NAME)

$(NAME):
	stack build
	cp $(EXE_PATH) ./wolfram

PHONY += clean
clean:
	@/bin/stack clean

PHONY += fclean
fclean: clean
	@$(RM) $(NAME)

PHONY += fclean
re: fclean all

.PHONY: $(PHONY)
