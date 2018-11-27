/*

To compile:

    gcc -lsodium task.c -o task.out

*/

#include <sodium.h>

int main(void)
{
  /* Initialize */
  if (sodium_init() < 0) { exit(1); }

  /* Allocate */
  unsigned int buf_len = 16;
  unsigned char buf[buf_len];
  unsigned int hex_len = buf_len * 2 + 1;
  char hex[hex_len];

  /* Generate */
  randombytes_buf(buf, buf_len);
  sodium_bin2hex(hex, hex_len, buf, buf_len);
  puts(hex);
  exit(0);
}
