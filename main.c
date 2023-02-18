#include <stdio.h>
#include <stdlib.h>

int     _ft_strlen(char *);
void    _ft_write(unsigned int, const char *, size_t);
void    _ft_read(unsigned int, char *, size_t);
char *  _ft_strcpy(char *, const char *);
int     _ft_strcmp(const char *, const char *);
char *  _ft_strdup(const char *);
int     _ft_atoi_base(char *, char *);

// README !!!!!! Please read the README to be able to run this code

int     main(){
    char str[100] = "All Hail Lelouch !!";
    char dest[100] = "";
    char str2[100] = "All Hail LeLouch !!";

    printf("\nThe size of the string : \n");
    _ft_write(1, str, _ft_strlen(str));

    printf(" is : %d\n", _ft_strlen(str));

    _ft_strcpy(dest, str);
    printf("\nThe dest string after the copy is : %s\n", dest);

    printf("\nThe difference between the two strings : %d\n", _ft_strcmp(str, str2));

    char * new = _ft_strdup(str);
    printf("\nThe duplicate string is : %s\n", new);

    char str3[100] = "   -+--101010 10";
    char base[100] = "01";
    printf("\n   -+--101010 10 in binary base with spaces and signs (-101010) : ");
    printf("%d\n", _ft_atoi_base(str3, base));

    printf("\nHere is the test of the _ft_read function, enter what you want(limited char) : \n");
    char empty[100] = "                                                          ";
    _ft_read(0, empty, _ft_strlen(empty));
    printf("\nThe string : %s\n", empty);

    return 0;
}