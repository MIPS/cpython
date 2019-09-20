#ifdef __MINGW32__
#define wcslen_s(A,B) wcslen(A)
#define wcsnlen_s(A,B) wcsnlen(A,B)
#define wcscat_s(A,B,C) wcscat(A,C)
#define wcstok(A,B,C) wcstok(A,B)
#define wcstok_s(A,B,C) wcstok(A,B)
#define wcscpy_s(A,B,C) wcscpy(A,C)
#define wcsncpy_s(A,B,C,D) wcsncpy(A,C,D)
#define wcsncasecmp _wcsnicmp
#define setenv(A,B,C) _putenv(A# C)
#endif
#include_next<wchar.h>
