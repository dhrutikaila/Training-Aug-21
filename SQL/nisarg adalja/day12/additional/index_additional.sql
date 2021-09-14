/*index */
/* An index is a performance-tuning method of allowing faster retrieval of records. An index creates an entry for each
value that appears in the indexed columns.*/

/* CREATE [UNIQUE] INDEX index_name
ON table_name
(index_col1 [ASC | DESC],
index_col2 [ASC | DESC],
...
index_col_n [ASC | DESC]);
*/
/*A simple index is an index on a single column, while a composite index is an
index on two or more columns. */

/* create index */
CREATE INDEX mon_idx ON Employee(MM);

--ALTER index
/*ALTER INDEX [IF EXISTS] index_name,
RENAME TO new_index_name;*/
ALTER INDEX mon_idx RENAME TO month_index 

--drop index 
/*DROP INDEX [IF EXISTS] index_name
[ CASCADE | RESTRICT ];*/

DROP INDEX month_index;


/* good practice */
/*
1. Build index on columns of integer type
2. Keep index as narrow as possible
3. Column order is important
4. Make sure the column you are building an index for is declared NOT NULL
5. Build an index only when necessary
/* The following guidelines indicate when the use of an index should be
reconsidered.
• Indexes should not be used on small tables.
• Tables that have frequent, large batch updates or insert operations.
• Indexes should not be used on columns that contain a high number of NULL
values.
• Columns that are frequently manipulated should not be indexed. */
