# Example for testing

When I run cflint on this file, I get parsing errors. I first thought they were related to the structure keys being mistakenly parsed as unscoped variables.
It appears that it is actually related to the parsing of the boolean value `!len( thing.getName() )`. A parsing error here seems to cascade into other errors being raised.
