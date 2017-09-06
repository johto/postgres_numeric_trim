#include "postgres.h"
#include "funcapi.h"
#include "fmgr.h"
#include "utils/builtins.h"
#include "utils/numeric.h"


PG_MODULE_MAGIC;

Datum numeric_trim(PG_FUNCTION_ARGS);
PG_FUNCTION_INFO_V1(numeric_trim);

Datum
numeric_trim(PG_FUNCTION_ARGS)
{
	Numeric num = PG_GETARG_NUMERIC(0);
	char *str;
	char *dot;
	char *last;
	Datum result;

	if (numeric_is_nan(num))
		PG_RETURN_NUMERIC(num);
	str = DatumGetCString(DirectFunctionCall1(numeric_out, PG_GETARG_DATUM(0)));
	dot = strchr(str, '.');
	if (dot == NULL)
	{
		pfree(str);
		PG_RETURN_NUMERIC(num);
	}
	else if (strchr(dot + 1, '.') != NULL)
	{
		/* shouldn't happen */
		pfree(str);
		PG_RETURN_NUMERIC(num);
	}
	last = strrchr(dot, '\0') - 1;
	while (*last == '0' && last > dot)
		last--;
	*(last + 1) = '\0';
	result = DirectFunctionCall3(numeric_in, CStringGetDatum(str), ObjectIdGetDatum(0), Int32GetDatum(0));
	pfree(str);
	PG_RETURN_DATUM(result);
}
