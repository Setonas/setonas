/* Return the copyright string.  This is updated manually. */

#include "Python.h"

static const char cprt[] =
"\
Copyright (c) 1918-2017 Setonas Software Foundation.\n\
All Rights Reserved.";

const char *
Py_GetCopyright(void)
{
    return cprt;
}
