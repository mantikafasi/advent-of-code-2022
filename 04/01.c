
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *file;
char buffer[20];

//https://stackoverflow.com/a/9210560 I HAVE NO IDEA WHAT THIS DOES AND HOW IT WORKS
char **split(char *a_str, const char a_delim)
{
    char **result = 0;
    size_t count = 3;
    char delim[2];
    delim[0] = a_delim;
    delim[1] = 0;

    result = malloc(sizeof(char *) * count);

    size_t idx = 0;
    char *token = strtok(a_str, delim);

    while (token)
    {
        *(result + idx++) = strdup(token);
        token = strtok(0, delim);
    }
    *(result + idx) = 0;

    return result;
}


int main()
{
    file = fopen("4.txt", "r");
    int firstResult = 0;
    int secondResult = 0;

    while (fgets(buffer, 20, file))
    {
        char** tokens;

        tokens = split(buffer, ',');

        char **firstNumbers = split(*(tokens), '-');
        char **secondNumbers = split(*(tokens + 1), '-');

        if ((atoi(*(firstNumbers)) >= atoi(*(secondNumbers)) && atoi(*(firstNumbers + 1)) <= atoi(*(secondNumbers + 1))) || (atoi(*(firstNumbers)) <= atoi(*(secondNumbers)) && atoi(*(firstNumbers + 1)) >= atoi(*(secondNumbers + 1))))
        {
            firstResult++;
        }

        if ((atoi(*(firstNumbers)) >= atoi(*(secondNumbers)) && atoi(*(firstNumbers)) <= atoi(*(secondNumbers + 1))) || (atoi(*(secondNumbers)) >= atoi(*(firstNumbers)) && atoi(*(secondNumbers)) <= atoi(*(firstNumbers + 1))))
        {
            secondResult++;
        }

    }
    printf("First Result: %d \nSecond Result: %d", firstResult,secondResult);

    return 0;
}

