#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>
#include <wiringPi.h>

#define SWITCH_PIN 8

int main(int argc, char **argv)
{
  uint8_t capture_state = 0;
  uint32_t capture_no = 0;

  pid_t capture_pid;

  char *name_format;
  uint8_t name_arg;

  uint8_t i;

  if (wiringPiSetup() == -1)
    return 1;

  pinMode(SWITCH_PIN, INPUT);

  for(i = 1; i < argc; i++)
  {
    if(strcmp(argv[i], "-o") == 0)
    {
      name_arg = i + 1;
      name_format = malloc(strlen(argv[name_arg]) + 1);
      strcpy(name_format, argv[name_arg]);
    }
  }
  printf("Got filename format: %s\n", name_format);

  while(1)
  {
    uint8_t gpio_state = digitalRead(SWITCH_PIN);
    if(capture_state == gpio_state)
    {
      printf("Detected GPIO change (%d)\n", gpio_state);
      capture_state = !gpio_state;
      if(capture_state)
      {
        printf("Starting capture no. %d.\n", capture_no);
        capture_pid = fork();

        if(capture_pid == 0)
        {
          sprintf(argv[name_arg], name_format, capture_no);

          int8_t exec_res = execvp("/usr/bin/raspivid", argv);
          if(exec_res == -1)
            printf("Could not start capture!\n");
        }
      }
      else
      {
        printf("Stopping capture no. %d.\n", capture_no);
        kill(capture_pid, SIGINT);
        capture_no++;
      }
    }

    delay(50);
  }

  return 0;
}
