-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION numeric_trim" to load this file. \quit

CREATE FUNCTION numeric_trim(numeric)
	RETURNS numeric
	AS 'numeric_trim', 'numeric_trim' LANGUAGE c STRICT;
