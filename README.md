
# Libasm

Libasm contains several basic functions coded in nasm elf64

## More

The functions included in this project are:
- _ft_write.s
- _ft_read.s
- _ft_strlen.s
- _ft_strcpy.s
- _ft_strcmp.s
- _ft_strdup.s
- _ft_atoi_base.s


## Installation

To run the main you must absolutely be under Linux and compile all the functions in assembler.  
Under MacOS it may be possible to compile by replacing elf64 by macho64

```bash
nasm -f elf64 -g _ft_strlen.s
nasm -f elf64 -g _ft_write.s 
nasm -f elf64 -g _ft_read.s 
nasm -f elf64 -g _ft_strcpy.s 
nasm -f elf64 -g _ft_strcmp.s 
nasm -f elf64 -g _ft_strdup.s 
nasm -f elf64 -g _ft_atoi_base.s 
```
    
## Running Tests

To run tests, run the following command

```bash
  gcc main.c *.o -no-pie
```


## Documentation

[Documentation](https://cs61.seas.harvard.edu/site/2018/Asm2/)


## Authors

- [@Lbensimo](https://github.com/Lbensimo)

