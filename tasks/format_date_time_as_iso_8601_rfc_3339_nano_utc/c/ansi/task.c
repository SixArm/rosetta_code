#include <stdio.h>
#include <time.h>

int main()
{
    time_t timer;
    char s[30];
    struct tm* tm_info;

    time(&timer);
    tm_info = localtime(&timer);

    strftime(s, 30, "%Y-%m-%d %H:%M:%S.000000000Z", tm_info);
    puts(s);

    return 0;
}
