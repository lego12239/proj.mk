#include <stdio.h>
#include <SDL2/SDL.h>
#include <my.h>

int
main(void)
{
	SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO);
	somefunc1();
#ifdef USE_libmya
	printf("libmya is used\n");
#endif
	return 0;
}

