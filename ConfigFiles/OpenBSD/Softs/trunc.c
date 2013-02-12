#include <unistd.h>
#include <sys/types.h>

int main(int argc, char **argv)
{
  if (argc != 3)
    {
      printf("USAGE: %s <filename> <size in bytes>\n", argv[0]);
    }
  else
    {
      int size = atoi(argv[2]);
      int out  = truncate(argv[1], size);
      return out;
    }
}
