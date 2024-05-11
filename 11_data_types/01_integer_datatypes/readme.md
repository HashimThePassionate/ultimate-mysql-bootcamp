## 2. Integer datatypes:

- we store whole numbers that don't have decimal points.
- Maximum Length
```sql
-------------------------------------------------------------------------------------------------------------------------------------
|   Type	    Storage (Bytes)	    Minimum Value Signed	Minimum Value Unsigned	Maximum Value Signed	Maximum Value Unsigned  |
|   TINYINT 	1	                -128	                        0	                    127	                    255             |
|   SMALLINT	2	                -32768	                        0	                    32767	                65535           |
|   MEDIUMINT	3	                -8388608	                    0	                    8388607	                16777215        |
|   INT        	4	                -2147483648	                    0	                    2147483647	            4294967295      |
|   BIGINT  	8	                -2^63	                        0	                    2^63-1	                2^64-1          |
-------------------------------------------------------------------------------------------------------------------------------------
```
- ZEROFILL

```
INT(4) => 0001
```
